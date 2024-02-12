terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.36"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_s3_bucket" "hsa28_main_bucket" {
  bucket = "hsa28-main-bucket-333"
  object_lock_enabled = true
}

resource "aws_s3_bucket" "hsa28_log_bucket" {
  bucket = "hsa28-log-bucket-333"
}
  
resource "aws_s3_bucket_logging" "hsa28_main_bucket_log" {
  bucket = aws_s3_bucket.hsa28_main_bucket.id

  target_bucket = aws_s3_bucket.hsa28_log_bucket.id
  target_prefix = "log/"
}

resource "aws_s3_bucket_versioning" "hsa28_main_bucket_version" {
  bucket = aws_s3_bucket.hsa28_main_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
