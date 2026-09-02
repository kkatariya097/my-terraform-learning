terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }

  backend "s3" {
    bucket = "my-tf-test-bucket-kkat-state"
    key    = "terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-1"
}

# create s3 bucket 
resource "aws_s3_bucket" "example" { #here, example is for internal reference
  bucket = "my-tf-test-bucket-kkat" #name of s3 bucket, must be unique

  tags = {
    Name        = "My bucket-1"
    Environment = "Dev"
  }
}