# VPC resource
# This creates the virtual private cloud - (isolated, private network)
resource "aws_vpc" "nasty-vpc" {

  # region = "eu-west-3"

  cidr_block           = "10.106.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "nasty-vpc"
  }

}