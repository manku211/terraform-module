output "security_groups_id" {
  value = aws_security_group.alb_eg1.id
}

output "target_group_arn"{
    value =aws_lb_target_group.demo-lb.arn
}