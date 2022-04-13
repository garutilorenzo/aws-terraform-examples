variable "AWS_ACCESS_KEY" {

}

variable "AWS_SECRET_KEY" {

}

variable "environment" {
  default = "staging"
}

variable "AWS_REGION" {
  default = "<CHANGE_ME>"
}

module "private-vpc" {
  region            = var.AWS_REGION
  my_public_ip_cidr = "<CHANGE_ME>"
  environment       = var.environment
  source            = "github.com/garutilorenzo/aws-terraform-examples/private-vpc"
}

output "private_subnets_ids" {
  value = module.private-vpc.private_subnet_ids
}

output "public_subnets_ids" {
  value = module.private-vpc.public_subnet_ids
}

output "security_group_id" {
  value = module.private-vpc.security_group_id
}

output "vpc_id" {
  value = module.private-vpc.vpc_id
}

module "bastion-host" {
  ssk_key_pair_name  = "<CHANGE_ME>"
  environment        = var.environment
  subnet_id          = module.private-vpc.public_subnet_ids[0]
  security_group_ids = [module.private-vpc.security_group_id]
  source             = "github.com/garutilorenzo/aws-terraform-examples/bastion-host"
}

output "bastion_host_ip" {
  value = module.bastion-host.bastion_ip
}

module "ec2-instance" {
  ssk_key_pair_name  = "<CHANGE_ME>"
  environment        = var.environment
  subnet_id          = module.private-vpc.private_subnet_ids[0]
  security_group_ids = [module.private-vpc.security_group_id]
  source             = "github.com/garutilorenzo/aws-terraform-examples/ec2-instance"
}

output "ec2_instance_ip" {
  value = module.ec2-instance.ec2_instance_ip
}