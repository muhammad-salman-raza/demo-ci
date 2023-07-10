provider "aws" {
  region = var.aws_region
}

resource "aws_ecr_repository" "repository" {
  name = var.ecr_repository_name
}

resource "aws_ecr_lifecycle_policy" "lifecycle_policy" {
  repository = aws_ecr_repository.repository.name

  policy = <<EOF
{
  "rules": [
    {
      "rulePriority": 10,
      "description": "Expire images older than 14 days",
      "selection": {
        "tagStatus": "any",
        "countType": "sinceImagePushed",
        "countUnit": "days",
        "countNumber": 14
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}

resource "aws_ecs_cluster" "cluster" {
  name = var.ecs_cluster_name
}

resource "aws_ecs_task_definition" "task_definition" {
  family                   = var.ecs_task_definition_family
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu = "256"
  memory = "512"
  execution_role_arn = "arn:aws:iam::647104268138:role/terraform"

  container_definitions = <<EOF
[
  {
    "name": "backend",
    "image": "${aws_ecr_repository.repository.repository_url}:${var.docker_image_tag}",
    "portMappings": [
      {
        "containerPort": 3000,
        "protocol": "tcp"
      }
    ],
    "environment": [
      {
        "name": "NODE_ENV",
        "value": "production"
      }
    ],
    "memory": 512
  }
]
EOF
}

resource "aws_ecs_service" "service" {
  name              = var.ecs_service_name
  cluster           = aws_ecs_cluster.cluster.id
  task_definition   = aws_ecs_task_definition.task_definition.arn
  desired_count     = var.ecs_service_desired_count
  launch_type       = "FARGATE"

  network_configuration {
    subnets            = var.subnets
    security_groups    = var.security_groups
    assign_public_ip   = true
  }
}

