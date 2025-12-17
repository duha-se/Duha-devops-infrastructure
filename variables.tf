variable "eks_lb_dns_name" {
  description = "The DNS name of the EKS LoadBalancer"
  type        = string
}

variable "eks_lb_zone_id" {
  description = "The Hosted Zone ID (CanonicalHostedZoneId) for the EKS LoadBalancer"
  type        = string
}

variable "route53_zone_id" {
  description = "The Hosted Zone ID for allopswithahmad.com"
  type        = string
}

variable "subdomain" {
  description = "Your app subdomain (e.g., duha.allopswithahmad.com)"
  type        = string
}