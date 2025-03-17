# Terraform Web Server Deployment

## Overview
This project uses Terraform to deploy a simple web server infrastructure on AWS. It demonstrates how to use **variables**, **local values**, and **outputs** for a scalable and flexible deployment.

## Project Structure

### `locals.tf`
```hcl
locals {
  ami_id = "ami-0520f976ad2e6300c"
  common_tags = {
    Project = "terraform web server"
  }
}
```
Defines:
- `ami_id`: Amazon Machine Image (AMI) ID for launching the instance.
- `common_tags`: A set of tags applied to all resources for better management.

### `main.tf`
```hcl
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
```
Defines:
- Terraform version requirement (`>= 0.14`).
- AWS provider configuration using `var.region`.
- EC2 instances:
  - Uses AMI ID from `locals.tf`.
  - Instance type and count are determined by variables.
  - Tags are applied from `locals.tf`.

### `variable.tf`
```hcl
variable "instance_type" {
  description   = "The type of instance to start"
  type          = string
  default       = "t2.micro"
}

variable "region" {
  description   = "The region in which to launch the instance"
  type          = string
  default       = "us-west-2"
}

variable "instance_count" {
  description   = "The number of instances to launch"
  type          = number
}
```
Defines:
- `instance_type`: Specifies the type of EC2 instance (default: `t2.micro`).
- `region`: Specifies the AWS region (default: `us-west-2`).
- `instance_count`: Defines the number of instances to launch.

### `output.tf`
```hcl
output "public_ips" {
  description = "The Public IP Address of the web server"
  value = aws_instance.web_server[*].public_ip
}

output "hostnames" {
  description = "The Public DNS of the web server"
  value = aws_instance.web_server[*].public_dns
}
```
Defines outputs:
- `public_ips`: Displays the public IP addresses of the deployed instances.
- `hostnames`: Displays the public DNS names of the instances.

---

## Getting Started
### 1. Clone the Repository
```sh
git clone https://github.com/glng-swndru/terraform-aws.git
cd terraform-aws/web-server
```

### 2. Initialize Terraform
```sh
terraform init
```
This downloads required providers and initializes the working directory.

### 3. Plan and Apply the Configuration
```sh
terraform plan
terraform apply -auto-approve
```
Terraform will deploy the specified number of EC2 instances.

### 4. Retrieve Outputs
After deployment, get the public IPs and DNS names:
```sh
terraform output public_ips
terraform output hostnames
```

### 5. Destroy the Infrastructure (Optional)
To remove all resources:
```sh
terraform destroy -auto-approve
```

---

## Summary
This project demonstrates:
✅ Using **variables** for flexibility.
✅ Defining **local values** for reusability.
✅ Using **outputs** to display key information.

It’s a great starting point for learning Terraform and automating AWS deployments! 🚀