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

variable "ecr_repository_name" {
  description = "Name of the ECR repository"
  default     = "demo-ci-ecr-repo"
}

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  default     = "demo-ci-ecs-cluster"
}

variable "ecs_task_definition_family" {
  description = "Family name of the ECS task definition"
  default     = "demo-ci-task-definition"
}

variable "docker_image_tag" {
  description = "Tag of the Docker image"
  default     = "v1.0.0"
}

variable "ecs_service_name" {
  description = "Name of the ECS service"
  default     = "demo-ci-ecs-service-1"
}

variable "ecs_service_desired_count" {
  description = "Desired count of ECS service tasks"
  default     = 2
}

variable "subnets" {
  description = "List of subnet IDs"
  default     = ["subnet-74147113", "subnet-030c6a5f"]
}

variable "security_groups" {
  description = "List of security group IDs"
  default     = ["sg-b3cc41f1"]
}
