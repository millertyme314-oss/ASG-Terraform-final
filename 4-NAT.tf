resource "aws_eip" "nasty-nat-eip" {

  tags = {
    Name = "nasty-nat-eip"
  }
}

resource "aws_nat_gateway" "nasty-nat" {
  allocation_id = aws_eip.nasty-nat-eip.id
  subnet_id     = aws_subnet.public-eu-west-3a.id

  tags = {
    Name = "nasty-nat-gateway"
  }

  depends_on = [aws_internet_gateway.igw]
}

# Uses an Elastic IP (EIP) and lives in a public subnet, translating private IPs to its public IP for outbound 
# traffic and back again for replies, enhancing security by hiding private instances