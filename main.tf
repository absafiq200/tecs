data "template_file" "container_tmpl" {
  template = file("container_def.json")

  vars = {
    "container_name" = "test-td",
    "imageurl" : "absafiq2000/demoapp:latest",
    "containerport" : "8080"
  }
}

resource "aws_ecs_task_definition" "my_td" {
  family                   = ""
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 512
  memory                   = 1024
  container_definitions    = data.template_file.container_tmpl.rendered
  task_role_arn            = aws_iam_role_policy.ecs_role_policy.arn
  execution_role_arn       = aws_iam_role_policy.ecs_role_policy.arn
}