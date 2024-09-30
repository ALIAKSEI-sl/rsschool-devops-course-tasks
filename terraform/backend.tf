terraform {
  backend "s3" {
    bucket = var.bucket_state_name
    key    = "terraform.tfstate"
    region = var.aws_region
    encrypt = true
  }
}
