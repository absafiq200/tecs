resource "aws_ecs_service" "my_scs_service" {
  name                               = "ecs-service-restapi"
  cluster                            = aws_ecs_cluster.ecs_cluster.id
  task_definition                    = aws_ecs_task_definition.my_td.arn
  desired_count                      = 2
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200
  platform_version                   = "1.4.0"
  launch_type                        = "FARGATE"
  scheduling_strategy                = "REPLICA"

  network_configuration {
    security_groups  = [aws_security_group.ecs_task_sg.id]
    subnets          = [var.public_subnets[0]]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.ecs_alb_target_group.arn
    container_name   = "test-td"
    container_port   = 8080
  }

}