terraform {
  backend "s3" {
    bucket = "practice-remote-state-123"
    key = "ec2-instance"
    region = "us-west-2"
    encrypt = true
  }
}