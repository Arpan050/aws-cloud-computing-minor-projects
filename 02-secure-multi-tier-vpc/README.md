# Project 02 - Secure Multi-Tier Web Application Network on AWS

## Objective

Design and implement a secure AWS network using a VPC with public and private subnets, route tables, an Internet Gateway, NAT Gateway, security groups and Network ACLs. The web tier is public while the database tier remains private.

## AWS Services

- VPC
- EC2
- Internet Gateway
- NAT Gateway
- Security Groups
- Network ACLs
- Route Tables

## Key Skills

- VPC and CIDR design
- Public/private subnet architecture
- Routing
- Bastion host access
- Linux server administration
- Nginx
- MariaDB
- Network security controls

## Architecture

Internet -> Internet Gateway -> Public Subnet (Nginx/Bastion) -> Private Subnet (MariaDB)

## Evidence

Add the strongest architecture, route table, security group, bastion and database connectivity screenshots to `screenshots/`.

## Original Report

[View the project report](./docs/project-report.pdf)

## Improvements to Consider

Document any production hardening not implemented in the academic project, such as tighter NACL rules, TLS termination and more restrictive administration access.
