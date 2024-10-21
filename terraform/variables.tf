variable "bucket_state_name" {
  description = "The Name of the S3 bucket for storing Terraform state"
  type        = string
  default     = "rs-aws-terraform-state"
}

variable "aws_iam_role_name" {
  description = "AWS IAM role name"
  type        = string
  default     = "GithubActionsRole"
}

variable "aws_region" {
  description = "The AWS region"
  type        = string
  default     = "eu-west-1"
}