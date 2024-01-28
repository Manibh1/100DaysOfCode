# The default provider configuration; resources that begin with `aws_` will use
# it as the default, and it can be referenced as `aws`.
provider "aws" {
  region = "us-east-1"
}

# Additional provider configuration for west coast region; resources can
# reference this as `aws.west`.
provider "aws" {
  alias  = "west"
  region = "us-west-2"
}
A provider block without an alias argument is the default configuration for that provider.Resources that don't 
set the provider meta-argument will use the default provider configuration that matches the first word of the resource type name
. (For example, an aws_instance resource uses the default aws provider configuration unless otherwise stated.)
