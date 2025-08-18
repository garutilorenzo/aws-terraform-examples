resource "aws_subnet" "public_subnets" {
  for_each          = toset(data.aws_availability_zones.available_az.zone_ids)
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block          = cidrsubnet(var.vpc_cidr_block, var.vpc_newbits, substr(each.key, -1, -1) + var.private_subnet_offset)
  availability_zone = data.aws_availability_zones.available_az[each.key].name

  map_public_ip_on_launch                     = true
  enable_resource_name_dns_a_record_on_launch = true
  private_dns_hostname_type_on_launch         = "resource-name"

  tags = merge(
    local.tags,
    {
      Name = "public-subnet-${each.key}-${var.environment}"
    }
  )
}

resource "aws_subnet" "private_subnets" {
  for_each          = toset(data.aws_availability_zones.available_az.zone_ids)
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block          = cidrsubnet(var.vpc_cidr_block, var.vpc_newbits, substr(each.key, -1, -1) + var.private_subnet_offset)
  availability_zone = data.aws_availability_zones.available_az[each.key].name

  map_public_ip_on_launch                     = false
  enable_resource_name_dns_a_record_on_launch = true
  private_dns_hostname_type_on_launch         = "resource-name"

  tags = merge(
    local.tags,
    {
      Name = "private-subnet-${each.key}-${var.environment}"
    }
  )
}