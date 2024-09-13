variable "cidr_blocks" {
  type        = string
  description = "value of the VPC CIDR block"
  
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "value of the public VPC CIDR block"
  

}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "value of the private VPC CIDR block"
  

}

variable "public_subnet_names" {
  type        = list(string)
  description = "Subnet name"
  
}

variable "private_subnet_names" {
  type        = list(string)
  description = "Subnet name"


}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones"
  
}
