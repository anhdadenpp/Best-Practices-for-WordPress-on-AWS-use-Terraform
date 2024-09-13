variable "cidr_blocks" {
  description = "value of the VPC CIDR block"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "value of the public VPC CIDR block"
  type        = list(string)

}

variable "private_subnet_cidrs" {
  description = "value of the private VPC CIDR block"
  type        = list(string)

}

variable "public_subnet_names" {
  description = "Subnet name"
  type        = list(string)

}

variable "private_subnet_names" {
  description = "Subnet name"
  type        = list(string)

}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)

}
