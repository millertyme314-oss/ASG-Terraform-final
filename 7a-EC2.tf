# resource "aws_instance" "devonaoki-ec2" {
#   ami           = "ami-0d3684aec6d12c883" # us-west-3
#   instance_type = "t2.micro"
#   security_groups = [aws_security_group.devonaoki-sg.id]
#   subnet_id = aws_subnet.public-eu-west-3a.id
#   associate_public_ip_address = true # unsure if this is needed, if subnet has a
#   # public_dns = true
#   # vpc_security_group_ids = [aws_security_group.devonaoki-sg.id]


#   user_data = file("user_data.sh")

#     tags = {
#     Name = "devonaoki-ec2"
#   }

# }
