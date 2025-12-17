# Infra Repository - Duha

This repository manages the infrastructure for the Dental Clinic app using Terraform.

## Features

- Creates Route 53 A record for `duha.allopswithahmad.com`
- Points subdomain to the EKS LoadBalancer
- Outputs full subdomain URL
- Terraform state is stored in S3 (remote backend)
- CI/CD via GitHub Actions

## Setup

1. Create GitHub Secrets:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

2. Configure variables in `terraform.tfvars` or directly via CLI:

```hcl
eks_lb_dns_name = "ab25c439c921647959f05120dfa9df32-346715728.us-west-2.elb.amazonaws.com"
eks_lb_zone_id = "Z1H1FL5HABSF5"
route53_zone_id = "Z0302029OQLS0XVBKVXD"
subdomain = "duha.allopswithahmad.com"