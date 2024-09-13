# Launch template
resource "aws_launch_template" "wp-template" {
  name_prefix   = "wordpress-"
  image_id      = "ami-0c4ae247afdd4ecf9"
  instance_type = "t2.micro"

  network_interfaces {
    security_groups             = [var.server_sg_id]
    associate_public_ip_address = true
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "wp"
  }
}

# Auto Scaling Group
resource "aws_autoscaling_group" "wp_asg" {
  desired_capacity    = 2
  max_size            = 3
  min_size            = 1
  vpc_zone_identifier = var.private_subnet_ids
  launch_template {
    id      = aws_launch_template.wp-template.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "example-asg"
    propagate_at_launch = true
  }

  target_group_arns = [var.target_group_arn] # Assuming you're using an ALB/NLB -> Fix here

  lifecycle {
    create_before_destroy = true
  }
}


