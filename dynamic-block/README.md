# Learning Terraform Dynamic Blocks

This project demonstrates the use of **dynamic blocks** in Terraform to create flexible and reusable infrastructure configurations. Specifically, it defines an **AWS Security Group** with multiple ingress rules using a `dynamic` block.

## What is a Dynamic Block?
A **dynamic block** in Terraform allows us to generate nested configurations dynamically based on a given input. Instead of writing multiple repeated blocks manually, we can use `for_each` to iterate over a list or map and generate the required resources or configurations.

## Project Overview
This example creates an **AWS Security Group** with ingress rules defined dynamically using the `dynamic` block feature. The security group will include multiple rules specified in the `ingress_rules` variable.

### Terraform Configuration Files
#### `main.tf`
- Defines an **AWS Security Group**.
- Uses a `dynamic` block to generate multiple **ingress** rules based on `var.ingress_rules`.

#### `variable.tf`
- Contains a list of ingress rules that will be applied to the security group.
- The default list includes rules for:
  - **HTTP (port 80, open to all IPs)**
  - **SSH (port 22, restricted to a specific IP)**

## How to Use
### Prerequisites
- **Terraform installed**: [Download Terraform](https://developer.hashicorp.com/terraform/downloads)
- **AWS CLI installed**: [AWS CLI Installation](https://aws.amazon.com/cli/)
- **AWS credentials configured** (`aws configure`)

### Steps to Deploy
1. **Clone this repository**:
   ```sh
   git clone https://github.com/glng-swndru/terraform-aws.git
   cd terraform-aws/dynamic-block
   ```
2. **Initialize Terraform**:
   ```sh
   terraform init
   ```
3. **Preview the execution plan**:
   ```sh
   terraform plan
   ```
4. **Apply the configuration**:
   ```sh
   terraform apply -auto-approve
   ```
5. **Verify the created security group in AWS**

### Destroying the Resources
To remove the created resources, run:
```sh
terraform destroy -auto-approve
```

## Why Use Dynamic Blocks?
- **Reduces code duplication**: No need to write multiple ingress rules manually.
- **Increases flexibility**: Rules can be modified easily by updating the `ingress_rules` variable.
- **Scalability**: Easily extendable for multiple use cases.

## Further Learning
📖 **Terraform Dynamic Blocks Documentation**: [HashiCorp Docs](https://developer.hashicorp.com/terraform/language/expressions/dynamic-blocks)

---

Happy Terraforming! 🚀

