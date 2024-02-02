resource "aws_subnet" "public_subnets" {
  count                                       = length(data.aws_availability_zones.available_az.zone_ids)
  vpc_id                                      = aws_vpc.main_vpc.id
  availability_zone_id                        = data.aws_availability_zones.available_az.zone_ids[count.index]
  cidr_block                                  = cidrsubnet(var.vpc_cidr_block, var.vpc_newbits, count.index)
  map_public_ip_on_launch                     = true
  enable_resource_name_dns_a_record_on_launch = true
  private_dns_hostname_type_on_launch         = "resource-name"
  tags = merge(
    local.tags,
    {
      Name = "public-subnet-${data.aws_availability_zones.available_az.names[count.index]}-${var.environment}"
    }
  )
}

resource "aws_subnet" "private_subnets" {
  count                                       = length(data.aws_availability_zones.available_az.zone_ids)
  vpc_id                                      = aws_vpc.main_vpc.id
  availability_zone_id                        = data.aws_availability_zones.available_az.zone_ids[count.index]
  cidr_block                                  = cidrsubnet(var.vpc_cidr_block, var.vpc_newbits, count.index + var.private_subnet_offset)
  map_public_ip_on_launch                     = false
  enable_resource_name_dns_a_record_on_launch = true
  private_dns_hostname_type_on_launch         = "resource-name"
  tags = merge(
    local.tags,
    {
      Name = "private-subnet-${data.aws_availability_zones.available_az.names[count.index]}-${var.environment}"
    }
  )
}