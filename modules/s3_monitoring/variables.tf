variable "bucket_name" {
  description = "The name of the S3 bucket to monitor"
  type        = string
}

variable "environment" {
  description = "The environment name (dev, staging, prod)"
  type        = string
}

variable "alarm_email" {
  description = "Email to receive CloudWatch alarm notifications"
  type        = string
}

variable "alarm_thresholds" {
  description = "Map of threshold values for alarms"
  type = object({
    number_of_objects_warning  = number
    bucket_size_bytes_warning  = number
  })
}


