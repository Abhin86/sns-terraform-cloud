terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

variable "AWS_SECRET_KEY" {
  description = "The AWS secret key"
  type        = string
  sensitive   = true
}

variable "AWS_ACCESS_KEY" {
  description = "The AWS Access key"
  type        = string
  sensitive   = true
}

provider "aws" {
  region = "us-east-1"
}

module "sns_topic" {
  source  = "terraform-aws-modules/sns/aws"

  name  = "simple"

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
