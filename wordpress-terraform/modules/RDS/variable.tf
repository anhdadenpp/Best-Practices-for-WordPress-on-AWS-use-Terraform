variable "database_sg_id" {
  description = "The ID of the security group for the RDS instance"
  type        = string

}

variable "private_subnet_ids" {
  description = "List of subnet IDs within the VPC"
  type        = list(string)
}
