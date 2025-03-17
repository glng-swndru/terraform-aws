# Terraform Workspace: Multiple Deployments

## Overview
This project is a simple practice setup for using Terraform Workspaces to manage multiple deployment environments (e.g., `staging` and `production`). Workspaces help keep separate configurations without needing multiple Terraform configurations.

## Project Structure

### `main.tf`
```hcl
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "workspace" {
  ami = "ami-0520f976ad2e6300c"
  instance_type = "t2.micro"
  tags = {
    Name = "instance${terraform.workspace}"
  }
}
```
This file defines the AWS provider and an EC2 instance. The `Name` tag dynamically changes based on the active Terraform workspace.

### `backend.tf`
```hcl
terraform {
  backend "s3" {
    bucket = "practice-remote-state-123"
    key = "ec2-instance"
    region = "us-west-2"
    encrypt = true
  }
}
```
This file configures Terraform to use an S3 bucket as the backend for storing the Terraform state.

---

## Getting Started

If you want to try this setup on your local machine, follow these steps:

### 1. Clone the Repository
```sh
git clone https://github.com/glng-swndru/terraform-aws.git
cd terraform-aws/multiple-deployment-workspace
```

### 2. Create an S3 Bucket for Terraform State
Since Terraform stores the remote state in an S3 bucket, you need to create one:
```sh
aws s3 mb s3://practice-remote-state-123 --region us-west-2
```
Make sure to replace `practice-remote-state-123` with a unique bucket name.

### 3. Initialize Terraform
```sh
terraform init
```
This will download necessary providers and set up the backend.

### 4. Work with Workspaces

#### Check Available Workspaces
```sh
terraform workspace list
```
By default, there’s only one workspace called `default`.

#### Create Workspaces
```sh
terraform workspace new staging
terraform workspace new production
```
Now you have separate `staging` and `production` environments.

#### Switch Between Workspaces
```sh
terraform workspace select staging
```
Use this command to switch between environments before deploying.

---

## Deploying EC2 Instances

### 1. Plan the Changes
```sh
terraform plan
```
This will show what Terraform is about to create or change.

### 2. Apply the Changes
```sh
terraform apply
```
Terraform will deploy an EC2 instance tagged with the current workspace name.

### 3. Switch to Another Workspace and Deploy
```sh
terraform workspace select production
terraform plan
terraform apply
```
This will deploy a new EC2 instance for the `production` environment.

---

## Summary
With Terraform Workspaces, you can manage multiple environments (`staging` and `production`) using the same configuration while keeping their states separate. This setup is useful for testing and organizing infrastructure efficiently.

---

## Notes
- Ensure your AWS credentials are configured before running Terraform commands.
- If you're working in a team, share the Terraform state bucket name so others can use the same setup.
- The EC2 instances created will have names like `instance-staging` or `instance-production`, based on the selected workspace.

Now you're ready to manage multiple deployments with Terraform Workspaces! 🚀

