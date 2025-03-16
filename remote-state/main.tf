#backend.tf 
terraform {
  backend "s3" {
    bucket = "practice-remote-state-123"
    key = "testing/ec2"
    region = "us-west-2"
    encrypt = true
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami = "ami-0520f976ad2e6300c"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }
}