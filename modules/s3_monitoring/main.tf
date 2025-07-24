module "s3_monitoring" {
  source = "../../modules/s3_monitoring"

  bucket_name      = var.bucket_name
  environment      = var.environment
  alarm_email      = var.alarm_email
  alarm_thresholds = var.alarm_thresholds
}




