data "template_file" "container_tmpl" {
  template = file("container_def.json")

  vars = {
    "container_name" = "test-td",
    "imageurl" : "187942322226.dkr.ecr.us-east-1.amazonaws.com/demoapp:latest",
    "containerport" : 8080
  }
}

