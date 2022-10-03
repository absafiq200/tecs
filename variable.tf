variable "ecs-service-name" {
  type    = string
  default = "test-svc-name"
}

variable "containerport" {
  type    = number
  default = 8080
}

variable "public_subnets" {
  type    = list(string)
  default = ["subnet-0ef8ff159a6518374", "subnet-094ebdafd1dfe224b", "subnet-07980e951c301b326"]
}

variable "private_subnets" {
  type    = list(string)
  default = ["subnet-0f3330b3600de1094", "subnet-0036aad667863c0a7", "subnet-020bb29cea472cb78"]
}

variable "vpc_cidr" {
  type    = string
  default = "172.31.0.0/16"
}

variable "from_port_ib" {
  type    = number
  default = 80
}

variable "to_port_ib" {
  type    = number
  default = 80
}

variable "vpc_id" {
    type = string
    default = "vpc-0e17759f40ea28d3a"
}