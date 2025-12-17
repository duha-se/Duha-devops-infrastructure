terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "duha-terraform-state"
    key    = "infrastructure.tfstate "
    region = "us-east-1"
  }
}