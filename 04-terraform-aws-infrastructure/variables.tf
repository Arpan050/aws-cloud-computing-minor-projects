variable "aws_region" {
  description = "AWS region in which to create the infrastructure."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Prefix used for resource names and tags."
  type        = string
  default     = "terraform-aws-infrastructure"
}

variable "vpc_cidr" {
  description = "CIDR range for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR range for the public subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Optional availability zone. If null, Terraform selects the first available AZ in the region."
  type        = string
  default     = null
  nullable    = true
}

variable "instance_type" {
  description = "EC2 instance type. Check current pricing and account eligibility before applying."
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Name of an existing EC2 key pair in the selected region."
  type        = string
}

variable "ssh_allowed_cidr" {
  description = "Your public IPv4 address with /32, for example 198.51.100.10/32. Replace the example before applying."
  type        = string

  validation {
    condition     = can(cidrnetmask(var.ssh_allowed_cidr)) && endswith(var.ssh_allowed_cidr, "/32")
    error_message = "ssh_allowed_cidr must be a valid IPv4 /32 CIDR, such as YOUR_PUBLIC_IP/32."
  }
}
