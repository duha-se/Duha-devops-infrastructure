provider "aws" {
  region  = "us-east-1"
  version = "~> 5.0"
}

resource "aws_route53_record" "app_subdomain" {
  allow_overwrite = true
  zone_id         = var.route53_zone_id
  name            = var.subdomain
  type            = "A"

  alias {
    name                   = var.eks_lb_dns_name
    zone_id                = var.eks_lb_zone_id
    evaluate_target_health = true
  }
}