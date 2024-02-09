provider "aws" {
  region = "us-west-2" // Change this to your desired region
}

module "eks" {
  source               = "terraform-aws-modules/eks/aws"
  cluster_name         = "my-cks-cluster"
  cluster_version      = "1.21" // Update to your desired Kubernetes version
  subnets              = ["subnet-12345678", "subnet-23456789", "subnet-34567890"] // Update with your subnet IDs
  vpc_id               = "vpc-0123456789abcdef0" // Update with your VPC ID
  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_type    = "t3.medium" // Update with your desired instance type
      key_name         = "your-key-pair-name" // Update with your SSH key pair name
    }
  }
  tags = {
    Environment = "Production"
  }
}
