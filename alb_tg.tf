resource "aws_lb" "ecs_alb" {
  name                       = "ecs-elb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.my_sec_grp.id]
  subnets                    = var.public_subnets
  enable_deletion_protection = false
}

resource "aws_alb_target_group" "ecs_alb_target_group" {
  name        = "alb-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    healthy_threshold   = "3"
    interval            = "30"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "3"
    unhealthy_threshold = "2"
  }
}

resource "aws_alb_listener" "http" {
  load_balancer_arn = aws_lb.ecs_alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_alb_target_group.ecs_alb_target_group.arn
    type             = "forward"
  }
}