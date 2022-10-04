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

