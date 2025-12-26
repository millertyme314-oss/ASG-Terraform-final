resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.nasty-vpc.id

  tags = {
    Name    = "da_igw"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

# IGW acts as a bridge, allowing two-way communication between your VPC resources and the public internet 
# (enabling internet access for updates and external services)