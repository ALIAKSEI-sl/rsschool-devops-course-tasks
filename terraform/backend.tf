terraform {
  backend "s3" {
    bucket = "rs-aws-terraform-state"
    key    = "terraform.tfstate"
    region = "eu-west-1"
    encrypt = true
  }
}
