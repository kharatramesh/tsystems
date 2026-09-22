variable "vpc_cidr" { type = string }
variable "region" { type = string }
variable "akey" { type = string }
variable "skey" { type = string }
variable "subnets" { type = map(object({ subnet_name = string, cidr_block = string, azone = string })) }
variable "igw" { type = string }
