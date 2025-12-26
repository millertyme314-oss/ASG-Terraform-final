resource "aws_security_group" "nasty-2-sg" {
  name        = "nasty-2-sg"
  description = "Allow TLS inbound traffic and all outbound traffic to nasty dungeon"
  vpc_id      = aws_vpc.nasty-vpc.id

  tags = {
    Name = "nasty-2-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "nasty-sg-http" {
  description                  = "HTTP from alb"
  security_group_id            = aws_security_group.nasty-2-sg.id
  referenced_security_group_id = aws_security_group.nasty-lb.id
  from_port                    = 80
  ip_protocol                  = "tcp"
  to_port                      = 80

  tags = {
    Name = "HTTP"
  }
}

resource "aws_vpc_security_group_ingress_rule" "nasty-sg-ssh" {
  description       = "SSH from internet"
  security_group_id = aws_security_group.nasty-2-sg.id
  cidr_ipv4         = aws_vpc.nasty-vpc.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

  tags = {
    Name = "SSH"
  }
}
resource "aws_vpc_security_group_egress_rule" "nasty-sg-egress" {
  security_group_id = aws_security_group.nasty-2-sg.id
  description       = "Allow all out traffic"
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

# acts as a virtual firewall, controlling inbound and outbound traffic to your web servers (EC2 instances)
# , allowing only authorized traffic like HTTP (port 80) and HTTPS (port 443) from the internet, 
# while blocking everything else, ensuring your application is accessible but secure
