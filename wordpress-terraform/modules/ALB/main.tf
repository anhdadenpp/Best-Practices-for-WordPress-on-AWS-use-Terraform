# Target group
resource "aws_lb_target_group" "example_tg" {
  name     = "ALB_TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200-299"
  }

  tags = {
    Name = "ALB_TG"
  }
}

# Application load balancer
resource "aws_lb" "wp-lb" {
  name               = "wordpress-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets            = [for subnet in var.public_subnet_ids : subnet]

  tags = {
    Name = "wordpress-lb"
  }
}

resource "aws_lb_listener" "example_listener" {
  load_balancer_arn = aws_lb.wp-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.example_tg.arn
  }

  tags = {
    Name = "example-listener"
  }
}
