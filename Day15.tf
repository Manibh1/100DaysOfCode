provider "aws" {
  region = "us-west-2"
}

resource "aws_cloudwatch_metric_alarm" "example" {
  alarm_name          = "example-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "80"
  
  dimensions = {
    InstanceId = "i-1234567890abcdef0"
  }

  alarm_description = "This metric monitors CPU utilization on the EC2 instance"
  alarm_actions     = ["arn:aws:sns:us-west-2:123456789012:example-topic"]
}
