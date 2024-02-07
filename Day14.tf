# Define the provider
provider "aws" {
  region = "us-east-1" # Specify your desired AWS region
}

# Create an S3 bucket
resource "aws_s3_bucket" "example_bucket" {
  bucket = "example-bucket-name" # Specify your desired bucket name
  acl    = "private" # Set the bucket access control list (ACL)
}

# Define bucket policy to grant access to a specific IAM user
resource "aws_s3_bucket_policy" "example_bucket_policy" {
  bucket = aws_s3_bucket.example_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = {
        AWS = "arn:aws:iam::ACCOUNT_ID:user/USERNAME" # Specify the ARN of the IAM user you want to grant access to
      },
      Action    = "s3:*",
      Resource  = "${aws_s3_bucket.example_bucket.arn}/*"
    }]
  })
}
