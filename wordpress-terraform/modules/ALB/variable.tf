variable "alb_sg_id" {
  description = "SG ID use for ALB"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for Security Group"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnets"
  type        = list(string)

}
