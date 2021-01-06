provider "aws" {
  region  = "eu-west-1"
}

data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "caller_arn" {
  value = data.aws_caller_identity.current.arn
}

output "caller_user" {
  value = data.aws_caller_identity.current.user_id
}

data "aws_subnet_ids" "main" {
  vpc_id = "vpc-0673cc8ed5d2b9e2a"
  tags = {
    Name = "ent-softbuild-sdlc-preprod-public-eu-west-1*"
  }
}

resource "aws_instance" "test_instance" {
  ami           = "ami-07d9160fa81ccffb5"
  instance_type = "t2.micro"
  subnet_id     = element(tolist(data.aws_subnet_ids.main.ids), 0)
}
