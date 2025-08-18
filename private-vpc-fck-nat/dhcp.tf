resource "aws_vpc_dhcp_options" "vpc_dhcp" {
  domain_name         = local.domain_name
  domain_name_servers = var.dns_servers

  tags = merge(
    local.tags,
    {
      Name = "dhcp-options-${var.environment}"
    }
  )
}

resource "aws_vpc_dhcp_options_association" "dns_resolver" {
  vpc_id          = aws_vpc.main_vpc.id
  dhcp_options_id = aws_vpc_dhcp_options.vpc_dhcp.id
}