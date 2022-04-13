locals {
  tags = {
    "environment" = "${var.environment}"
  }
  domain_name = "${var.region}-${var.domain_name}"
}