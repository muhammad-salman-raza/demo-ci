provider "aws" {
  region = var.aws_region
}

data "aws_caller_identity" "current" {}

# Create an S3 bucket to store the Dockerrun file
resource "aws_s3_bucket" "bucket" {
  bucket = var.s3_bucket_name
  acl    = "private"
}

# Upload the Dockerrun file to the S3 bucket
resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.bucket.bucket
  key    = "Dockerrun.aws.json"
  source = "Dockerrun.aws.json"
  acl    = "private"
}

# Create an Elastic Beanstalk application
resource "aws_elastic_beanstalk_application" "app" {
  name        = var.eb_application_name
  description = "My application"
}

# Create an Elastic Beanstalk application version
resource "aws_elastic_beanstalk_application_version" "version" {
  application = aws_elastic_beanstalk_application.app.name
  name        = var.docker_image_version
  description = "My version"
  bucket      = aws_s3_bucket_object.object.bucket
  key         = aws_s3_bucket_object.object.key
}

# Create an Elastic Beanstalk environment
resource "aws_elastic_beanstalk_environment" "environment" {
  name                = var.eb_environment_name
  application         = aws_elastic_beanstalk_application.app.name
  version_label       = aws_elastic_beanstalk_application_version.version.name
  solution_stack_name = "64bit Amazon Linux 2018.03 v2.15.0 running Multi-container Docker 19.03.13-ce (Generic)"
}
