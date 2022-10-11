variable "vpc_cidr" {
  type = list
  default = []
}

variable "env" {
  type = string
  default = "dev"
}

variable "public_subnet_cidrs" {
  type = list
  default = []
}

variable "private_subnet_cidrs" {
  type = list
  default = []
}
