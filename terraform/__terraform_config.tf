terraform {
  required_version = ">= 0.12.31"

  required_providers {
    aws = "~> 4.8.0"
  }
}

provider "aws" {
  profile = "burner"
  region  = "us-east-1"
}
