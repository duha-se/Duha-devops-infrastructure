terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket = "duha-terraform-state"
    key    = "infrastructure.tfstate"
    region = "us-east-1"
  }
}