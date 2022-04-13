variable "region" {

}

variable "my_public_ip_cidr" {
  type = string

}

variable "vpc_cidr_block" {
  type    = string
  default = "172.68.0.0/16"
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