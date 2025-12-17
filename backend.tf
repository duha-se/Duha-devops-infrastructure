terraform {
  backend "s3" {
    bucket = "duha-terraform-state"
    key    = "infrastructure.tfstate"
    region = "us-east-1"
  }
}