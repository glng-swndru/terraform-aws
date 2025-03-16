#main.tf
terraform {
  required_version = ">= 0.14"
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "web_server" {
  ami           = local.ami_id
  instance_type = var.instance_type
  tags          = local.common_tags
  count         = var.instance_count
}