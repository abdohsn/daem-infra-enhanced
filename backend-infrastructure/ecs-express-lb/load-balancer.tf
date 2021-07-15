resource "aws_alb" "application_load_balancer" {
  name               = "backend-lb-tf" # Naming our load balancer
  load_balancer_type = "application"
  subnets = [ # Referencing the default subnets
    "${data.aws_subnet.default_subnet_a.id}",
    "${data.aws_subnet.default_subnet_b.id}",
    "${data.aws_subnet.default_subnet_c.id}"
  ]
  # Referencing the security group
  security_groups = ["${aws_security_group.load_balancer_security_group.id}"]
}

