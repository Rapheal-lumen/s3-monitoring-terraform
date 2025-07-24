module "s3_monitoring" {
  source = "../../modules/s3_monitoring"

  bucket_name = "my-s3-bucket-name"
  environment = "dev"
  alarm_email = "your-alert-email@example.com"

  alarm_thresholds = {
    number_of_objects_warning = 100000
    bucket_size_bytes_warning = 1000000000  # 1 GB
  }
}



