provider "aws" {
  region  = "eu-west-1"
}

data "aws_vpc" "main" {
  filter {
    name   = "tag:Name"
    values = ["fr-vpc-1"]
  }
}

data "aws_subnet_ids" "main" {
  vpc_id = data.aws_vpc.main.id
  tags = {
    Name = "ent-softbuild-sdlc-preprod-public-eu-west-1*"
  }
}

resource "aws_instance" "test_instance" {
  ami           = "ami-00ddb0e5626798373"
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnet_ids.main.ids
}
