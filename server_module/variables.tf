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

variable "user_data" {}

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

variable "ami_filter_name" {
  type = string
  default = "name"
}

variable "ami_filter_values" {
  type = list
  default = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
}

variable "key_pair_name" {
  type = string
  default = "vln-key-ca-central-1"
}