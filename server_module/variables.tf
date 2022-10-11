variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "replace_userdata_on_change" {
  type = bool
  default = false
}

variable "count_instances" {
  type = number
  default = 1
}

variable "env" {
  type = string
  default = "dev"
}

variable "project" {
  type = string
  default = "Wagtail WebApp"
}

variable "owner" {
  type = string
  default = "Vladimir Nechay"
}

variable "user_data" {
  default =<<EOF
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
}

variable "security_groups" {
  type = list
  default = []
}

variable "ebs_block_config" {
  type = list
  default = []
}

variable "ami_owner" {
  type = list
  default = ["137112412989"]
}

variable "ami_most_resent" {
  type    = bool
  default = true
}

variable "ami_filter" {
  type = list
  default = [
    {
    name = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
    }
  ]
}

variable "key_pair_name" {
  type = string
  default = "vln-key-ca-central-1"
}