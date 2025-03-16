#locals.tf
locals {
  ami_id = "ami-0520f976ad2e6300c"
  common_tags = {
    Project = "terraform web server"
  }
}