output "public_subnet_ids" {
  depends_on = [
    aws_subnet.public_subnets
  ]
  value = aws_subnet.public_subnets.*.id
}

output "private_subnet_ids" {
  depends_on = [
    aws_subnet.private_subnets
  ]
  value = aws_subnet.private_subnets.*.id
}

output "security_group_id" {
  value = aws_security_group.allow-strict.id
}

output "vpc_id" {
  value = aws_vpc.main_vpc.id
}