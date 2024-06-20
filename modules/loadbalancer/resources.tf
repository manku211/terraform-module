resource "aws_security_group" "alb_eg1" {
  name   = "alb-eg1"
  vpc_id = var.vpc_ids
}

resource "aws_lb_target_group" "demo-lb" {
  name       = "demo-targetgroup"
  port       = 80
  protocol   = "HTTP"
  vpc_id     = var.vpc_ids
  slow_start = 0

  load_balancing_algorithm_type = "round_robin"

  stickiness {
    enabled = false
    type    = "lb_cookie"
  }

  health_check {
    enabled             = true
    port                = 80
    interval            = 30
    protocol            = "HTTP"
    path                = "/"
    matcher             = "200"
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}
resource "aws_lb_target_group_attachment" "my_app_eg1" {
  for_each = toset(var.web_instance_ids)
  target_group_arn = aws_lb_target_group.demo-lb.arn
  target_id        = each.value
  port             = 80
}

resource "aws_lb" "my_app_eg1" {
  name               = "demo-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_eg1.id]


  subnets = var.subnet_ids
}
resource "aws_lb_listener" "http_eg1" {
  load_balancer_arn = aws_lb.my_app_eg1.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.demo-lb.arn
  }
}