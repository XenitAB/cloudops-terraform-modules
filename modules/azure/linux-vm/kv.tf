#tfsec:ignore:AZU020 tfsec:ignore:AZU021
resource "tls_private_key" "ssh_admin_key" {
  for_each = {
    for vm in var.vm_config :
    vm.vm_name => vm
  }
  algorithm = "RSA"
  rsa_bits  = "4096"
}

#tfsec:ignore:AZU023
resource "azurerm_key_vault_secret" "ssh_admin_key_secret" {
  for_each = {
    for vm in var.vm_config :
    vm.vm_name => vm
  }
  name         = "private-ssh-${each.value.vm_name}"
  value        = trimspace(tls_private_key.ssh_admin_key[each.key].private_key_openssh)
  key_vault_id = each.value.key_vault_id
  content_type = "x509 string"
}
