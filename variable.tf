variable "ecs-service-name" {
  type    = string
  default = "test-svc-name"
}

variable "containerport" {
  type    = int
  default = 8080
}