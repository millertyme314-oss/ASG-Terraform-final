resource "aws_launch_template" "web_tier" {
  # Launch template for EC2 instance
  name        = "web-tier-server-template"
  description = "launch template for web tier servers"

  image_id = "ami-078abd88811000d7e"

  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.nasty-2-sg.id]

  tags = {
    Name = "web-tier-server-template"
  }

  user_data = filebase64("user_data.sh")

  tag_specifications {
    resource_type = "instance"
    tags = {
      ManagedBy = "Terraform"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

