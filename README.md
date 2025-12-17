# DevOps Infrastructure – Terraform & AWS

## Overview

This repository contains production-grade **Infrastructure as Code (IaC)** using **Terraform** to manage DNS infrastructure for an application running on **Amazon EKS**.

The infrastructure is intentionally separated from the application codebase to follow industry-standard DevOps practices such as separation of concerns, controlled deployments, and auditable infrastructure changes.

---

## What This Repository Does

This Terraform project:

* Creates an **AWS Route 53 Alias A record**
* Points the subdomain to an **EKS Service LoadBalancer**
* Uses an **S3 backend** for remote Terraform state
* Outputs the full public **subdomain URL**
* Deploys infrastructure automatically using **GitHub Actions**

---

## Architecture

User traffic flows as follows:

User → Route 53 (duha.allopswithahmad.com) → AWS LoadBalancer → EKS Service → Application Pods

---

## Repository Structure

```
.
├── main.tf
├── variables.tf
├── outputs.tf
├── backend.tf
├── terraform.tfvars
├── .github/workflows/terraform.yml
├── .gitignore
└── README.md
```

---

## Terraform Configuration

* AWS provider version `~> 5.0`
* Fully variable-driven configuration
* No hard-coded values or credentials
* AWS-recommended Alias record for LoadBalancer
* Remote state stored securely in S3

---

## Remote State Management

Terraform state is stored in **Amazon S3**, enabling:

* Safe team collaboration
* Centralized state management
* No local `.tfstate` files
* Protection from accidental overwrites

Terraform state files are never committed to the repository.

---

## GitHub Actions CI/CD Workflow

This repository uses **GitHub Actions** to enforce a safe and professional Terraform workflow.

### Pull Request Flow (Plan Only)

Triggered on Pull Requests to `main`:

* terraform init
* terraform fmt -check
* terraform validate
* terraform plan

This ensures all infrastructure changes are reviewed before being applied.

---

### Main Branch Flow (Apply)

Triggered only after merging to `main`:

* terraform init
* terraform apply -auto-approve

Infrastructure is applied **only after code review**, following production best practices.

---

## Security Practices

* AWS credentials stored securely in **GitHub Secrets**
* No secrets committed to GitHub
* `.tfstate` and `.tfvars` excluded using `.gitignore`
* Principle of least privilege applied

---

## Subdomain Details

* Root domain: allopswithahmad.com
* Subdomain: duha.allopswithahmad.com
* Record type: Route 53 Alias A Record
* Target: AWS LoadBalancer created by EKS Service

---

## Verification

Application health can be verified using:

```bash
curl http://duha.allopswithahmad.com:5001/health
```

Expected response:

```json
{
  "status": "healthy"
}
```

---

## Why This Approach

This setup reflects real-world DevOps and cloud engineering practices:

* Infrastructure and application are managed independently
* All infrastructure changes require review
* Remote Terraform state prevents conflicts
* CI/CD ensures repeatable and auditable deployments
* DNS and cloud resources are fully automated

---

## Usage

1. Create a Pull Request with Terraform changes
2. Review the Terraform plan in GitHub Actions
3. Merge the Pull Request
4. Terraform automatically applies the changes
5. DNS updates propagate safely

---

## Production Readiness

This repository demonstrates:

* Infrastructure as Code (Terraform)
* GitOps-style workflows
* Secure AWS resource management
* Automated CI/CD pipelines
* Production-grade DNS management