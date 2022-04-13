data "template_cloudinit_config" "bastion_host" {
  gzip          = true
  base64_encode = true

  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = templatefile("${path.module}/files/cloud-config-base.yaml", {})
  }

  part {
    content_type = "text/x-shellscript"
    content      = templatefile("${path.module}/files/setup_bastion.sh", { ssh_keys = local.ssh_keys, bastion_user = var.bastion_user, bastion_group = var.bastion_group })
  }
}