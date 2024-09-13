variable "bastion_sg_id" {
  description = "SG ID use for EC2 bastion"
  type        = string

}

variable "server_sg_id" {
  description = "SG ID use for EC2 webserver"
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

variable "public_subnet_ids" {
  description = "Subnet ID"
  type        = list(string)

}

variable "private_subnet_ids" {
  description = "Subnet ID"
  type        = list(string)

}

variable "ec2_names" {
  description = "Names of EC2 instances"
  type        = list(string)
  default     = ["WebServer1", "WebServer2"]

}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)

}
