resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = element(aws_subnet.public_subnets.*.id, 0)
  depends_on    = [aws_internet_gateway.vpc_gw]
  tags = merge(
    local.tags,
    {
      Name = "nat-gw-${var.environment}"
    }
  )
}