resource "aws_iam_policy" "example_policy" {
  name        = "example_policy"
  description = "An example IAM policy"
  
  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Action    = "*"
      Resource  = "*"
    }]
  })
}
