variable "efs_sg_id" {
  description = "SG ID use for EFS"
  type        = string

}

variable "private_subnet_ids" {
  description = "Private subnet ID"
  type        = list(string)
}
