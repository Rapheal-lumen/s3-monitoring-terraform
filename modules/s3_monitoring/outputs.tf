output "sns_topic_arn" {
  value = aws_sns_topic.alarm_notifications.arn
}

output "dashboard_name" {
  value = aws_cloudwatch_dashboard.s3_dashboard.dashboard_name
}



