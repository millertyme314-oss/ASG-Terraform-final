#These are   for  public
resource "aws_subnet" "public-eu-west-3a" {
  vpc_id                  = aws_vpc.nasty-vpc.id
  cidr_block              = "10.106.1.0/24"
  availability_zone       = "eu-west-3a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-eu-west-3a"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

resource "aws_subnet" "public-eu-west-3b" {
  vpc_id                  = aws_vpc.nasty-vpc.id
  cidr_block              = "10.106.2.0/24"
  availability_zone       = "eu-west-3b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-eu-west-3b"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}


resource "aws_subnet" "public-eu-west-3c" {
  vpc_id                  = aws_vpc.nasty-vpc.id
  cidr_block              = "10.106.3.0/24"
  availability_zone       = "eu-west-3c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-eu-west-3c"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

#These are for private
resource "aws_subnet" "private-eu-west-3a" {
  vpc_id            = aws_vpc.nasty-vpc.id
  cidr_block        = "10.106.11.0/24"
  availability_zone = "eu-west-3a"

  tags = {
    Name    = "private-eu-west-3a"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

resource "aws_subnet" "private-eu-west-3b" {
  vpc_id            = aws_vpc.nasty-vpc.id
  cidr_block        = "10.106.12.0/24"
  availability_zone = "eu-west-3b"

  tags = {
    Name    = "private-eu-west-3b"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}


resource "aws_subnet" "private-eu-west-3c" {
  vpc_id            = aws_vpc.nasty-vpc.id
  cidr_block        = "10.106.13.0/24"
  availability_zone = "eu-west-3c"

  tags = {
    Name    = "private-eu-west-3c"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

# a range of IP addresses within your Virtual Private Cloud (VPC) 
# that acts as a logical network segment, allowing you to organize and isolate resources like EC2 instances,
# with each subnet residing in a single Availability Zone (AZ) for high availability
