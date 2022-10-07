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
  default = []
}

variable "ebs_delete_on_termination" {
  type = bool
  default = true
}

variable "ebs_device_name" {
  type = string
  default = null
}

variable "ebs_encrypted" {
  description = "Encryption of EBS volume. Cannot be used with snapshot_id"
  type = bool
  default = false
}

variable "ebs_kms_key_id" {
  default = null
}

variable "ebs_snapshot_id" {
  default = null
}

variable "ebs_volume_size" {
  type = number
  default = 0
}

variable "ebs_volume_type" {
  type = string
  default = null
}

variable "ebs_block_config" {
  type = list
  default = []
}