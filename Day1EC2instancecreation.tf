provider "aws" {
    region = "us-east-1"  # Set your desired AWS region
}

resource "aws_instance" "example" {
    ami           = "ami-0a3c3a20c09d6f377"  # Specify an appropriate AMI ID
    instance_type = "t2.micro"
    subnet_id = "subnet-044c6078428fc57d4"
    key_name = "manibh-keypair"
}
