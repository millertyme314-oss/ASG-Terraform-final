# Create a new ALB Target Group attachment
resource "aws_autoscaling_attachment" "web-tier" {
  autoscaling_group_name = aws_autoscaling_group.web_tier.name
  lb_target_group_arn    = aws_lb_target_group.nasty-tg.arn
}
# the action or configuration that links an EC2 instance (or multiple) to an Auto Scaling Group (ASG),
# allowing the ASG to manage its lifecycle, health, and load balancing