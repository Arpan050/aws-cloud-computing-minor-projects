# Terraform AWS Infrastructure Setup

A Terraform-based AWS infrastructure project based on the fourth Cloud Computing minor project. It expresses the lab's VPC, public subnet, internet routing, SSH security group, and EC2 setup as reusable Infrastructure as Code (IaC).

> **Configuration note:** The original coursework report showed the infrastructure in one `main.tf` file. The code here is a reorganized, parameterized portfolio version derived from that report. Review it and test it in your own AWS account before use; do not assume it is an exact copy of the file used during the original lab.

## Objective

Provision a VPC, public subnet, Internet Gateway, route table, SSH security group, and Amazon Linux 2023 EC2 instance using Terraform rather than creating each resource manually in the AWS Console.

## Architecture

```text
Administrator
    |
    | SSH (TCP/22 from the configured /32 IPv4 CIDR only)
    v
Internet
    |
Internet Gateway
    |
Public Route Table (0.0.0.0/0 -> Internet Gateway)
    |
Public Subnet (10.0.1.0/24)
    |
EC2 Instance (Amazon Linux 2023, t3.micro by default)
```

## Resources managed by Terraform

- VPC with DNS support and DNS hostnames enabled
- Public subnet with public IPv4 assignment enabled
- Internet Gateway
- Public route table and subnet association
- Security group allowing SSH only from a supplied IPv4 `/32` CIDR
- EC2 instance using the latest matching Amazon Linux 2023 AMI
- Outputs for the instance public IP, instance ID, VPC ID, and subnet ID

The coursework report described seven AWS resources being created. The AMI and availability-zone lookups in this portfolio configuration are Terraform data sources, not resources created by the configuration.

## Tools and concepts

Terraform, HCL, AWS provider, AWS CLI, VPC, subnetting, Internet Gateway, route tables, security groups, EC2, SSH, Terraform state, `init`, `plan`, `apply`, and `destroy`.

## Prerequisites

1. Terraform installed in WSL/Linux.
2. AWS CLI installed and configured in WSL with credentials for an IAM identity allowed to create and manage these resources.
3. An EC2 key pair already created in the same AWS region.
4. Your current public IPv4 address so SSH can be restricted to your `/32` CIDR.

Do not put AWS access keys, secret keys, private key files, `terraform.tfstate`, or real `terraform.tfvars` files in Git.

## Run from WSL/Linux

Run the following commands from this project directory.

```bash
aws sts get-caller-identity
cp terraform.tfvars.example terraform.tfvars
nano terraform.tfvars
```

In `terraform.tfvars`, replace `203.0.113.10/32` with your actual public IPv4 address followed by `/32`, and set `key_name` to the exact key-pair name in the selected region. The example IP is reserved for documentation and will not let you connect.

Then run:

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
terraform apply
```

Review the plan before approving `terraform apply`. Once deployment completes, retrieve the instance IP with:

```bash
terraform output -raw instance_public_ip
```

Connect with the existing private key for the key pair configured in `terraform.tfvars`:

```bash
ssh -i /path/to/terraform-key.pem ec2-user@$(terraform output -raw instance_public_ip)
```

Replace the key path with the actual path to your private key. Do not copy the private key into this repository.

## Clean up

When you have finished validating the project, remove the infrastructure to avoid ongoing AWS charges:

```bash
terraform destroy
```

Review the resources Terraform proposes to destroy and confirm only when you intend to remove them.

## Security and cost notes

- SSH ingress is restricted to a single administrator IPv4 address (`/32`). Do not use `0.0.0.0/0` for SSH.
- The EC2 instance is placed in a public subnet and receives a public IP. This is a learning configuration, not a production architecture.
- Egress is open to all IPv4 destinations in this lab configuration.
- EC2, public IPv4 use, and other AWS resources may incur charges. Check current pricing and your account's eligibility before applying, and destroy the resources when finished.
- Terraform state can contain infrastructure metadata and sensitive values. Keep it local for this exercise; do not commit it.

## Verification checklist

- [ ] `terraform fmt -recursive` completes.
- [ ] `terraform init` completes successfully.
- [ ] `terraform validate` passes.
- [ ] `terraform plan` shows the intended resources and no unexpected destroys.
- [ ] `terraform apply` completes and returns the instance public IP.
- [ ] The EC2 instance is visible in the expected AWS region.
- [ ] SSH access succeeds from the allowed source IP.
- [ ] `terraform destroy` completes after testing.

Only mark a check as complete after verifying it yourself.

## Possible next improvements

- Replace public SSH access with AWS Systems Manager Session Manager.
- Add a private subnet and remove direct public access to compute resources.
- Use a remote Terraform backend with locking for collaborative use.
- Add automated formatting and validation with GitHub Actions.
