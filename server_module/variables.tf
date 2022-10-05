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

variable "allow_ports" {
  type = list
  default = [80, 22]
}

variable "sg_cidr" {
  type = list
  default = ["0.0.0.0/0"]
}

variable "sg_protocol" {
  type = string
  default = "tcp"
}

variable "ssh_port" {
  type = number
  default = 22
}

variable "ssh_protocol" {
  type = string
  default = "tcp"
}

variable "ssh_cidr" {
  type = list
  default = ["0.0.0.0/0"]
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