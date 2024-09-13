output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.wp_vpc.id

}

output "public_subnet_ids" {
  value = aws_subnet.public_subnets[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private_subnets[*].id
}
