resource "aws_cloudwatch_dashboard" "s3_dashboard" {
  dashboard_name = "${var.bucket_name}-dashboard-${var.environment}"

  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric",
        width = 24,
        height = 6,
        properties = {
          metrics = [
            [ "AWS/S3", "BucketSizeBytes", "BucketName", var.bucket_name, "StorageType", "StandardStorage" ]
          ],
          view = "timeSeries",
          stacked = false,
          region = "us-east-1",
          title = "S3 Bucket Size (Bytes)"
        }
      },
      {
        type = "metric",
        width = 24,
        height = 6,
        properties = {
          metrics = [
            [ "AWS/S3", "NumberOfObjects", "BucketName", var.bucket_name, "StorageType", "AllStorageTypes" ]
          ],
          view = "timeSeries",
          stacked = false,
          region = "us-east-1",
          title = "Number of Objects"
        }
      }
    ]
  })
}



