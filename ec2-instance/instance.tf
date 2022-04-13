resource "aws_instance" "ec2_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.ssk_key_pair_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  tags = merge(
    local.tags,
    {
      Name = "ec2-instance-${var.environment}"
    }
  )
}