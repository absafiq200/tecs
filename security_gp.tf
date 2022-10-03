//security group for alb
resource "aws_security_group" "alb_sg" {
    name = "my-alb-sg"
    vpc_id =
    ingress {
        from_port = var.from_port_ib
        to_port = var.to_port_ib
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags {
        Name = "my-alb-sg"
    }
}

//Security group for ecs task
resource "aws_security_group" "ecs_task_sg" {
    name
    vpc_id

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]        
    }

    ingress {
        from_port = 0
        to_port = 0
        protocol= "-1"
        security_groups = [aws_security_group.alb_sg]

    }

    egress {
        from_port = 0
        to_port= 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags {
        Name = "dev"
    }

}