# Create an IAM policy
resource "aws_iam_policy" "s3_access_policy" {
  name        = "s3-access-policy"  # Specify the policy name
  description = "Policy to grant access to S3 bucket"

  policy = data.aws_iam_policy_document.s3_bucket_policy.json
}

# Attach the IAM policy to the IAM user
resource "aws_iam_user_policy_attachment" "s3_access_attachment" {
  user       = aws_iam_user.s3_user.name
  policy_arn = aws_iam_policy.s3_access_policy.arn
}
