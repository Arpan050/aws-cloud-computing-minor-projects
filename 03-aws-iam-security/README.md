# Project 03 - AWS IAM Roles, Policies and Permission Best Practices

## Objective

Implement role-based AWS access for Developers, DevOps Engineers and Auditors using IAM users, groups, custom policies, managed policies, an EC2 IAM role, MFA and permission validation.

## AWS Services

- IAM
- EC2
- S3
- CloudWatch

## Key Skills

- IAM users and groups
- JSON policy authoring
- Least-privilege access control
- IAM roles for EC2
- MFA
- Permission testing and validation

## Access Model

- Developers -> custom S3 policy
- DevOps -> EC2 / CloudWatch operations policy
- Auditors -> read-only managed policy
- EC2 -> S3 read-only role

## Evidence

Add screenshots showing the IAM groups, policies, role, MFA and permission test results to `screenshots/`.

## Policies

Place reusable policy JSON files in `policies/`.

## Original Report

[View the project report](./docs/project-report.pdf)
