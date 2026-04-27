output "public_subnet_ids" {
  value = {
    for zone_id, subnet in aws_subnet.public_subnets : zone_id => subnet.id
  }
}

output "private_subnet_ids" {
  value = {
    for zone_id, subnet in aws_subnet.private_subnets : zone_id => subnet.id
  }
}

output "private_route_table_ids" {
  value = {
    for zone_id, rt in aws_route_table.vpc_private_rt : zone_id => rt.id
  }
}

output "public_route_table_id" {
  value = aws_route_table.vpc_public_rt.id
}

output "security_group_id" {
  value = aws_security_group.allow-strict.id
}

output "vpc_id" {
  value = aws_vpc.main_vpc.id
}