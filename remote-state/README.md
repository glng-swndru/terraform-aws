# Terraform Remote State: Managing State in S3

## What is Remote State in Terraform?
Terraform uses a state file (`terraform.tfstate`) to keep track of the infrastructure it manages. By default, this file is stored locally, but in a team or multi-environment setup, local state files can be a problem because:
- They can get lost or overwritten.
- They don’t allow collaboration.
- They don’t support locking to prevent conflicts.

To solve this, Terraform allows storing state remotely in a backend like AWS S3. This enables:
✅ Centralized storage of Terraform state.
✅ Team collaboration with shared state.
✅ State locking (when combined with DynamoDB) to avoid conflicts.

## Project Overview
This project demonstrates how to use **Terraform Remote State** by storing the state file in an **S3 bucket**.

## Project Structure

### `main.tf`
```hcl
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
```
### What This Code Does
1. **Configures the S3 Backend**:
   - Stores Terraform state in `practice-remote-state-123` bucket.
   - Saves state file under the path `testing/ec2`.
   - Enables encryption for security.

2. **Defines AWS Provider**:
   - Uses the `us-west-2` region.

3. **Creates an EC2 Instance**:
   - Uses `ami-0520f976ad2e6300c` (Amazon Linux 2 AMI).
   - Instance type is `t2.micro`.
   - Assigns the tag `Name = ExampleInstance`.

---

## Getting Started
### 1. Clone the Repository
```sh
git clone https://github.com/glng-swndru/terraform-aws.git
cd terraform-aws/remote-state
```

### 2. Create an S3 Bucket for State Storage
```sh
aws s3 mb s3://practice-remote-state-123 --region us-west-2
```
Ensure the bucket name is unique if you are creating your own.

### 3. Initialize Terraform
```sh
terraform init
```
This will:
✅ Download necessary providers.
✅ Configure the S3 backend.
✅ Create the `.terraform` directory for dependency tracking.

### 4. Plan and Apply the Configuration
```sh
terraform plan
terraform apply -auto-approve
```
Terraform will deploy an EC2 instance and store its state in the S3 bucket instead of locally.

### 5. Verify the State File in S3
Check the S3 bucket `practice-remote-state-123` and navigate to `testing/ec2`. You should see a `terraform.tfstate` file containing details of the deployed infrastructure.

---

## Summary
By using **remote state**, this project ensures:
✔ Terraform state is centrally stored in S3.
✔ No risk of local state loss.
✔ Future changes can be tracked and applied from anywhere.

If you want to collaborate with a team or manage multiple environments efficiently, using **remote state** is a best practice. 🚀