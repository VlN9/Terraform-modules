data "aws_ami" "latest_amazon_linux" {
  owners      = ["137112412989"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }
}

data "aws_key_pair" "my_key" {}

resource "aws_instance" "web_server" {
  count                  = var.count_instances
  ami                    = data.aws_ami.latest_amazon_linux.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.wagtail_web_sg.id]
  key_name               = data.aws_key_pair.my_key.key_name
  user_data              =<<EOF
#!/bin/bash
sudo yum -y upgrade
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo yum -y install git
sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
EOF
  user_data_replace_on_change = var.replace_userdata_on_change
  tags = { 
    Name    = "${var.env}-WebServer-${count.index + 1}" 
    Owner   = var.owner
    Project = var.project    
    }
}

resource "aws_security_group" "wagtail_web_sg" {
  name = "Web Security Group"
  dynamic "ingress" {
    for_each = var.allow_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = var.sg_protocol
      cidr_blocks = var.sg_cidr
    }
  }

  ingress {
    from_port = var.ssh_port
    to_port = var.ssh_port
    protocol = var.ssh_protocol
    cidr_blocks = var.ssh_cidr
  }

  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      self             = false
    }
  

  tags = { Name = "${var.env} Security Group" }
}