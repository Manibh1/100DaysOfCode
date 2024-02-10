#Define AWS provider
provider "aws" {
  region = "us-east-1"
}

# Create IAM role for EC2 instance
resource "aws_iam_role" "ec2_role" {
  name               = "ec2_s3_access_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}