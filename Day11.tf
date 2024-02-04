# main.tf

# Define your AWS provider
provider "aws" {
  region = "us-west-2"
}

# Define an AWS EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}

# Define a null resource to trigger drift detection
resource "null_resource" "drift_detection" {
  triggers = {
    # Change this value to trigger drift detection
    timestamp = "${timestamp()}"
  }

  # Run terraform plan as part of the null resource
  provisioner "local-exec" {
    command = "terraform plan"
  }
}
