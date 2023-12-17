terraform {
/*  backend "s3" {
    bucket = "s3-bucket-ashutosh"
    region = "ap-south-1"
    key    = "terraform/terraform.tfstate"
    dynamodb_table = "firstdbtable"
  } */
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}
