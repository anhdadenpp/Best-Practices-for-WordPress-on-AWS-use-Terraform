variable "server_sg_id" {
  description = "SG ID use for EC2 server"
  type        = string
}

variable "private_subnet_ids" {
  description = "Subnet ID"
  type        = list(string)
}

variable "target_group_arn" {
  description = "Target group ARN"
  type        = string
}
