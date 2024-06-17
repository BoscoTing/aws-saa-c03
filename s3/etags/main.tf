terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.53.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-3"
}

resource "aws_s3_bucket" "default" {
  bucket = "etags-example-bosco"
}

resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.default.id
  key    = "myfile.txt"
  source = "myfile.txt"
  
  etag = filemd5("./myfile.txt")
}
