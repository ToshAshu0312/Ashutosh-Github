terraform {
/*  backend "s3" {
    bucket = "s3-bucket-ashutosh"
    region = "ap-south-1"
    key = "terraform/learning.tfstate"
  }
*/
  required_version = "~>1.6.2"
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
