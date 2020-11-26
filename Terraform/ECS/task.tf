resource "aws_ecs_task_definition" "webService" {
  family                   = var.name
  container_definitions    = <<DEFINITION
[
  {
    "cpu": 512,
    "essential": true,
    "image": "${var.Repo_URL}",
    "memory": 1024,
    "memoryReservation": 1024,
    "name": "${var.name}",
    "portMappings": [
      {
        "containerPort": 80
      }
    ],
    "environment": [
        {
          "name": "port",
          "value": "80"
        }
      ]
  }
]
DEFINITION
  requires_compatibilities = ["FARGATE"]
  cpu                      = "512"
  memory                   = "1024"
  network_mode             = "awsvpc"
  execution_role_arn       = data.aws_iam_role.ecs_task_execution_role.arn

}