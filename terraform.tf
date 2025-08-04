terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.4.0"
    }
  }
#   backend "s3" {
#     bucket         = "eks-terra-backend-s3-bucket" # name of s3 bucket for backend
#     key            = "file/terraform.tfstate" 
#     region         = "ap-south-1"
#     encrypt        = true
#     dynamodb_table = "State-file-lock-table" # name of your dynamodb table for state file lock
#   } 
}

provider "aws" {

    region = var.region
}
