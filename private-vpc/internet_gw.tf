resource "aws_internet_gateway" "vpc_gw" {
  vpc_id = aws_vpc.main_vpc.id
  tags = merge(
    local.tags,
    {
      Name = "internet-gw-${var.environment}"
    }
  )
}