# HSA27

Simple Storage

# Simple Storage on AWS

This template contains Terraform configuration for set up of 2 S3 Bucket `aws_s3_bucket`

First S3 bucket provides versioning `aws_s3_bucket_versioning` and object lock to make any uploaded object unchangable

Second S3 bucket contains logs for all requests to the first bucket configured with `aws_s3_bucket_versioning`
