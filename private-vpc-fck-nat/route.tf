resource "aws_route_table" "vpc_private_rt" {
  for_each = toset(data.aws_availability_zones.available_az.zone_ids)
  vpc_id   = aws_vpc.main_vpc.id

  tags = merge(
    local.tags,
    {
      Name = "private-rt-${var.environment}"
    }
  )
}

resource "aws_route_table" "vpc_public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  tags = merge(
    local.tags,
    {
      Name = "public-rt-${var.environment}"
    }
  )
}

resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.vpc_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc_gw.id
}

resource "aws_route_table_association" "public" {
  for_each       = toset(data.aws_availability_zones.available_az.zone_ids)
  subnet_id      = aws_subnet.public_subnets[each.key].id
  route_table_id = aws_route_table.vpc_public_rt.id
}

resource "aws_route_table_association" "private" {
  for_each       = toset(data.aws_availability_zones.available_az.zone_ids)
  subnet_id      = aws_subnet.private_subnets[each.key].id
  route_table_id = aws_route_table.vpc_private_rt[each.key].id
}