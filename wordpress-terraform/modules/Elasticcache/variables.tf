variable "private_subnet_ids" {
  description = "Private subnet ID"
  type        = list(string)

}

variable "ec_sg_id" {
  description = "SG ID use for EC"
  type        = string

}
