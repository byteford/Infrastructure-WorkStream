resource "aws_ecs_service" "web" {
  name                              = "web"
  cluster                           = aws_ecs_cluster.main.id
  task_definition                   = aws_ecs_task_definition.webService.arn
  desired_count                     = 1
  launch_type                       = "FARGATE"
  health_check_grace_period_seconds = "60"
  load_balancer {
    target_group_arn = var.lbTarget
    container_name   = var.name
    container_port   = 80
  }
  network_configuration {
    subnets          = var.subnets
    security_groups  = list(var.SecGroup)
    assign_public_ip = true
  }


}
resource "aws_ecs_cluster" "main" {
  name = var.name
}
