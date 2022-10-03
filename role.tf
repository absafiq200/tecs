resource "aws_iam_role" "ecs_role" {
  name = "ecs-iam-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = ["ecs.amazonaws.com", "ecs-tasks.amazonaws.com", "ecr.amazonaws.com"]
        }
      },
    ]
  })
}

resource "aws_iam_role_policy" "ecs_role_policy" {
  name = "ecs-role-policy"
  role = aws_iam_role.ecs_role.id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : [
          "ecs:*",
          "logs:*",
          "cloudwatch:*",
          "ecr:*",
          "elasticloadbalancing:*"
        ],
        "Resource" : "*",
        "Effect" : "Allow"
      }
    ]
  })
}