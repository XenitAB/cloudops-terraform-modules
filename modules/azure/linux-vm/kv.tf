#tfsec:ignore:AZU020 tfsec:ignore:AZU021
resource "tls_private_key" "ssh_admin_key" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

#tfsec:ignore:AZU023
resource "azurerm_key_vault_secret" "ssh_admin_key_secret" {
  name         = "private-ssh-${each.value.vm_config.name}"
  value        = trimspace(tls_private_key.ssh_admin_key.private_key_openssh)
  key_vault_id = var.vm_config.key_vault_id
  content_type = "x509 string"
}
