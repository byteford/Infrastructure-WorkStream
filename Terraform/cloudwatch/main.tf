resource "aws_cloudwatch_metric_alarm" "response_time" {
  alarm_name                = var.name
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "TargetResponseTime"
  namespace                 = "AWS/ApplicationELB"
  period                    = "180"
  statistic                 = "Average"
  threshold                 = var.res_threshold
  alarm_description         = "This metric monitors ec2 cpu utilization"
  insufficient_data_actions = []
  dimensions = {
    LoadBalancer = var.loadbalancer_arn_suffix
  }
}