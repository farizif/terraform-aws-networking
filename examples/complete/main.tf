module "networking" {
  source  = "farizif/networking/aws"
  version = "0.1.1"

  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "My VPC"
  }

  subnet_config = {
    subnet_1 = {
      cidr_block = "10.0.0.0/24"
      az         = "us-east-1f"
    }
    subnet_2 = {
      cidr_block = "10.0.2.0/24"
      public     = true
      az         = "us-east-1a"
    }
    subnet_3 = {
      cidr_block = "10.0.1.0/24"
      az         = "us-east-1a"
    }
    subnet_4 = {
      cidr_block = "10.0.3.0/24"
      public     = true
      az         = "us-east-1b"
    }
  }
}