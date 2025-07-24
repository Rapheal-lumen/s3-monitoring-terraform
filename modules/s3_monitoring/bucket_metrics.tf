resource "aws_cloudwatch_metric_alarm" "object_count_alarm" {
  alarm_name          = "${var.bucket_name}-object-count-alarm-${var.environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "NumberOfObjects"
  namespace           = "AWS/S3"
  period              = 86400
  statistic           = "Average"
  threshold           = var.alarm_thresholds.number_of_objects_warning
  alarm_description   = "Alarm when object count exceeds threshold"
  dimensions = {
    BucketName = var.bucket_name
    StorageType = "AllStorageTypes"
  }

  alarm_actions = [aws_sns_topic.alarm_notifications.arn]
}

resource "aws_cloudwatch_metric_alarm" "bucket_size_alarm" {
  alarm_name          = "${var.bucket_name}-bucket-size-alarm-${var.environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "BucketSizeBytes"
  namespace           = "AWS/S3"
  period              = 86400
  statistic           = "Average"
  threshold           = var.alarm_thresholds.bucket_size_bytes_warning
  alarm_description   = "Alarm when bucket size exceeds threshold"
  dimensions = {
    BucketName = var.bucket_name
    StorageType = "StandardStorage"
  }

  alarm_actions = [aws_sns_topic.alarm_notifications.arn]
}


resource "aws_sns_topic" "alarm_notifications" {
  name = "${var.bucket_name}-sns-topic-${var.environment}"
}

resource "aws_sns_topic_subscription" "email_sub" {
  topic_arn = aws_sns_topic.alarm_notifications.arn
  protocol  = "email"
  endpoint  = var.alarm_email
}




