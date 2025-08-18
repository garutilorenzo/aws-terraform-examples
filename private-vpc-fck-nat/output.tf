output "public_subnet_ids" {
  value = toset([
    for s in aws_subnet.public_subnets : s.id
  ])
}

output "private_subnet_ids" {
  value = toset([
    for s in aws_subnet.private_subnets : s.id
  ])
}

output "security_group_id" {
  value = aws_security_group.allow-strict.id
}

output "vpc_id" {
  value = aws_vpc.main_vpc.id
}