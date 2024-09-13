resource "aws_efs_file_system" "efs" {
  encrypted = false
  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }

  tags = {
    Name = "wp-efs"
  }
}

# Mount target Subnet 1
resource "aws_efs_mount_target" "mount_target_az1" {
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = var.private_subnet_ids[0]
  security_groups = [var.efs_sg_id]
}
