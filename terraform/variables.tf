variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  default     = "demo-ci"
}

variable "eb_application_name" {
  description = "Name of the Elastic Beanstalk application"
  default     = "demo-ci"
}

variable "eb_environment_name" {
  description = "Name of the Elastic Beanstalk environment"
  default     = "demo-ci"
}

variable "docker_image_version" {
  description = "Docker image version"
  default     = "v1"
}
