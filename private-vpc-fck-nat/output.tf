output "public_subnet_ids" {
  value = {
    for subnet, details in aws_subnet.public_subnets:
    subnet => details
  }
}

output "private_subnet_ids" {
  value = {
    for subnet, details in aws_subnet.private_subnets:
    subnet => details
  }
}

output "security_group_id" {
  value = aws_security_group.allow-strict.id
}

output "vpc_id" {
  value = aws_vpc.main_vpc.id
}