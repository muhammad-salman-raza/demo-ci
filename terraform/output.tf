output "bucket_id" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.bucket.id
}

output "eb_app_name" {
  description = "The name of the Elastic Beanstalk application"
  value       = aws_elastic_beanstalk_application.app.name
}

output "eb_environment_name" {
  description = "The name of the Elastic Beanstalk environment"
  value       = aws_elastic_beanstalk_environment.environment.name
}

output "eb_environment_url" {
  description = "The URL of the Elastic Beanstalk environment"
  value       = aws_elastic_beanstalk_environment.environment.endpoint
}
