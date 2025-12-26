resource "aws_autoscaling_group" "web_tier" {
  name = "web-server-asg"
  vpc_zone_identifier = [aws_subnet.private-eu-west-3a.id,
                         aws_subnet.private-eu-west-3b.id,
                         aws_subnet.private-eu-west-3c.id]
  max_size            = 6
  min_size            = 3
  health_check_type = "ELB"
  target_group_arns = [aws_lb_target_group.nasty-tg.arn]
  force_delete = true
  
  launch_template {
    id = aws_launch_template.web_tier.id
    version = "$Latest"
  }

  tag {
    key = "Name"
    value = "web-instance"
    propagate_at_launch = true
  }


}
# a service that automatically adjusts the number of Amazon EC2 instances to match application demand, 
# ensuring high availability and cost efficiency by scaling