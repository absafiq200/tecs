variable "ecs-service-name" {
  type    = string
  default = "test-svc-name"
}

variable "containerport" {
  type    = number
  default = 8080
}