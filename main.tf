provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "test_instance" {
  ami           = "ami-0dc8d444ee2a42d8a"
  instance_type = "t2.micro"
}
