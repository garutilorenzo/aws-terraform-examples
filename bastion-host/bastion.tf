resource "aws_instance" "bastion_host" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.ssk_key_pair_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  user_data = data.template_cloudinit_config.bastion_host.rendered

  tags = merge(
    local.tags,
    {
      Name = "bation-host-${var.environment}"
    }
  )

}