resource "aws_security_group" "allow-strict" {
  vpc_id      = aws_vpc.main_vpc.id
  name        = "allow-strict"
  description = "security group that allows ssh and all egress traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol  = "-1"
    self      = true
    from_port = 0
    to_port   = 0
  }

  tags = merge(
    local.tags,
    {
      Name = "sg-allow-strict-${var.environment}"
    }
  )
}

resource "aws_security_group_rule" "ingress_ssh" {
  count             = length(var.my_public_ip_cidrs) > 0 ? 1 : 0
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = var.my_public_ip_cidrs
  security_group_id = aws_security_group.allow-strict.id
}