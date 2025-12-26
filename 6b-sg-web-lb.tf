resource "aws_security_group" "nasty-lb" {
  name        = "nasty-lb"
  description = "Allow HTTP for web tier ALB"
  vpc_id      = aws_vpc.nasty-vpc.id

  tags = {
    Name = "nasty-lb"
    Tier = "web"
  }
}

resource "aws_vpc_security_group_ingress_rule" "nasty-lb-http" {
  description       = "HTTP from internet"
  security_group_id = aws_security_group.nasty-lb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80

  tags = {
    Name = "HTTP"
  }
}

resource "aws_vpc_security_group_egress_rule" "devonaoki-lb-egress" {
  security_group_id = aws_security_group.nasty-lb.id
  description       = "Allow all outbound traffic"
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

# acts as a virtual firewall, controlling traffic to and from the load balancer itself,
# defining who can connect (Frontend SG) and allowing the LB to talk to your backend servers (Backend SG)