resource "aws_ecs_task_definition" "webService" {
  family                = "service"
  container_definitions = <<DEFINITION
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

  volume {
    name      = "service-storage"
    host_path = "/ecs/service-storage"
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [eu-west-1a]"
  }
}