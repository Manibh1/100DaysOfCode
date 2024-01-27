provider "aws" {
  region = "us-west-2" # Set your desired region
}

# Define the Lambda function
resource "aws_lambda_function" "my_lambda_function" {
  filename      = "lambda_function_payload.zip" # Path to your Lambda function code
  function_name = "my_lambda_function" # Name of your Lambda function

  handler = "lambda_function.handler" # Entry point to your Lambda function

  runtime = "python3.8" # Runtime environment for your Lambda function

  # Set environment variables if needed
  environment {
    variables = {
      ENV_VAR1 = "value1"
      ENV_VAR2 = "value2"
    }
  }
}
