resource "aws_ecs_task_definition" "webService" {
  family                   = "service"
  container_definitions    = <<DEFINITION
[
  {
    "cpu": 128,
    "essential": true,
    "image": "${var.Repo_URL}",
    "memory": 128,
    "memoryReservation": 64,
    "name": "${var.name}"
  }
]
DEFINITION
  requires_compatibilities = ["FARGATE"]
  cpu                      = "512"
  memory                   = "1024"
  network_mode             = "awsvpc"
  execution_role_arn       = data.aws_iam_role.ecs_task_execution_role.arn

}