resource "aws_lb_target_group" "target_group" {
  name        = "database-target-group"
  port        = 27017
  protocol    = "TCP"
  target_type = "ip"
  vpc_id      = "${data.aws_vpc.default_vpc.id}" # Referencing the default VPC
  health_check {
    
  }
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = "${data.aws_alb.application_load_balancer.arn}" # Referencing our load balancer
  port              = "27017"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.target_group.arn}" # Referencing our tagrte group
  }
}