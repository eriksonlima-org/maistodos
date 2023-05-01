terraform {
  backend "s3" {
    bucket          = "maistodos-terraform-backend"
    dynamodb_table  = "terraform_state"
    region          = "us-east-1"
    encrypt         = true
    key             = "network/terraform-network.tfstate"
  }
  required_version = "~>1.4.0"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>4.65.0"
    }
  }
}

provider "aws" {
    region = local.region
    default_tags {
        tags = local.default_tags
    }
}

data "aws_caller_identity" "self" {}