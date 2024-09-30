provider "aws" {
  region = var.aws_region
}

resource "aws_iam_role" "github_actions_role" {
  name = var.aws_iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRoleWithWebIdentity"
        "Principal": {
        "Federated": "arn:aws:iam::012345678910:oidc-provider/token.actions.githubusercontent.com"
        },
        "Condition" = {
          "StringEquals": {
            "token.actions.githubusercontent.com:aud": "sts.amazonaws.com",
            "token.actions.githubusercontent.com:sub": "repo:ALIAKSEI-sl/rsschool-devops-course-tasks:*"
        }
        }
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "ec2_full_access" {
  name       = "ec2-full-access"
  roles      = [aws_iam_role.github_actions_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_policy_attachment" "route53_full_access" {
  name       = "route53-full-access"
  roles      = [aws_iam_role.github_actions_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonRoute53FullAccess"
}

resource "aws_iam_policy_attachment" "s3_full_access" {
  name       = "s3-full-access"
  roles      = [aws_iam_role.github_actions_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_policy_attachment" "iam_full_access" {
  name       = "iam-full-access"
  roles      = [aws_iam_role.github_actions_role.name]
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}

resource "aws_iam_policy_attachment" "vpc_full_access" {
  name       = "vpc-full-access"
  roles      = [aws_iam_role.github_actions_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
}

resource "aws_iam_policy_attachment" "sqs_full_access" {
  name       = "sqs-full-access"
  roles      = [aws_iam_role.github_actions_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"
}

resource "aws_iam_policy_attachment" "eventbridge_full_access" {
  name       = "eventbridge-full-access"
  roles      = [aws_iam_role.github_actions_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEventBridgeFullAccess"
}