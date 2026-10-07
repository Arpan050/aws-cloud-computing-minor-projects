# Project 01 - Static Website Hosting Using EC2 and S3 (Nginx)

## Objective

Launch an EC2 instance, install Nginx, host a static webpage, create a private S3 bucket, and upload a website backup from the EC2 instance using an IAM role.

## AWS Services

- EC2
- S3
- IAM

## Key Skills

- Amazon Linux administration
- SSH / EC2 Instance Connect
- Nginx installation and configuration
- Security group configuration
- IAM instance roles
- AWS CLI and S3 sync

## Architecture

User -> EC2 (Nginx) -> S3 (backup storage)

## Evidence

Add the strongest screenshots to `screenshots/` and any reusable architecture diagram to `architecture/`.

## Original Report

[View the project report](./docs/project-report.pdf)

## Improvements to Consider

Replace broad S3 permissions with a resource-scoped least-privilege IAM policy for production-style access.
