provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "a250232-test-instance" {
  ami           = "ami-0dc8d444ee2a42d8a"
  instance_type = "t2.micro"
  subnet_id     = "subnet-012f41946fd900e6c"
}
