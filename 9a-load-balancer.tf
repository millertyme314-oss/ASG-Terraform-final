resource "aws_lb" "web_tier" {
  name               = "web-tier-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.nasty-lb.id]
  subnets            = [aws_subnet.public-eu-west-3a.id, 
                        aws_subnet.public-eu-west-3b.id,
                        aws_subnet.public-eu-west-3c.id]

  enable_deletion_protection = false


  tags = {
    Name = "web-tier-alb"
  }
}

# automatically distributes incoming application traffic across multiple targets