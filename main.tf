data "template_file" "container_tmpl" {
  template = file("container_def.json")

  vars = {
    "container_name" = "test-td",
    "imageurl" : "absafiq2000/demoapp:latest",
    "containerport" : 8080
  }
}

