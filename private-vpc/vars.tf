variable "region" {}

variable "my_public_ip_cidr" {
  type = string
}

variable "vpc_cidr_block" {
  type    = string
  default = "172.68.0.0/16"
}

# Ref. Terraform doc: https://developer.hashicorp.com/terraform/language/functions/cidrsubnet
variable "vpc_newbits" {
  description = "newbits used to calculate the private and public subnet CIDRs using cidrsubnet fn"
  type        = number
  default     = 8
}

variable "private_subnet_offset" {
  description = "Offset used to calculate the private subnet CIDRs using cidrsubnet fn"
  type        = number
  default     = 3
}

variable "domain_name" {
  type    = string
  default = "aws-cloud.compute.internal"
}

variable "environment" {
  type    = string
  default = "staging"
}

variable "dns_servers" {
  type    = list(string)
  default = ["AmazonProvidedDNS"]
}