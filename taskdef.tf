resource "aws_ecs_task_definition" "my_td" {
  container_definitions    = data.template_file.container_tmpl.rendered
  family                   = "test_ts"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 512
  memory                   = "1024"
  task_role_arn            = aws_iam_role.ecs_role.arn
  execution_role_arn       = aws_iam_role.ecs_role.arn
  skip_destroy             = true
}