resource "aws_lb_target_group" "nasty-tg" {
# Routes requests to specific targets and performs health checks on them (optional)
  name     = "web-tier-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.nasty-vpc.id

  health_check {
    enabled = true
  }
}
