# Providing a reference to our default VPC
data "aws_vpc" "default_vpc" {
  tags = {
    Name = "Default VPC"
  }
}

# Providing a reference to our default subnets
data "aws_subnet" "default_subnet_a" {
  availability_zone = "us-east-2a"

  tags = {
    Name = "Default subnet for us-east-2a"
  }
}

data "aws_subnet" "default_subnet_b" {
  availability_zone = "us-east-2b"

  tags = {
    Name = "Default subnet for us-east-2b"
  }
}

data "aws_subnet" "default_subnet_c" {
  availability_zone = "us-east-2c"

  tags = {
    Name = "Default subnet for us-east-2c"
  }
}