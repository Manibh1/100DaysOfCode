# Provider configurations for different regions
provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "us-west-2"
  region = "us-west-2"
}

# Define variables
variable "instance_type" {
  default = "t2.micro"
}

variable "ami" {
  default = "ami-12345678"  # Replace this with your desired AMI ID
}

# EC2 instance in us-east-1
resource "aws_instance" "example_instance_us_east_1" {
  provider      = aws.us-east-1
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "ExampleInstanceUSEast1"
  }
}

# EC2 instance in us-west-2
resource "aws_instance" "example_instance_us_west_2" {
  provider      = aws.us-west-2
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "ExampleInstanceUSWest2"
  }
}

# Output the public IP addresses of the instances
output "public_ip_us_east_1" {
  value = aws_instance.example_instance_us_east_1.public_ip
}

output "public_ip_us_west_2" {
  value = aws_instance.example_instance_us_west_2.public_ip
}
