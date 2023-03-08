# To get the type handler version run
# az vm extension image list --location westeurope --output table
resource "azurerm_virtual_machine_extension" "aad_ssh_login_for_linux" {
  count                = var.vm_config.count
  name                 = "AADSSHLoginForLinux"
  virtual_machine_id   = azurerm_linux_virtual_machine.vm[count.index].id
  publisher            = "Microsoft.Azure.ActiveDirectory"
  type                 = "AADSSHLoginForLinux"
  type_handler_version = "1.0"
  automatic_upgrade_enabled = true
}

resource "azuread_group" "admin_group" {
  count            = var.vm_config.count
  display_name     = lower("SEC-VM-${local.vm_config_name}-${format("%02s", count.index + 1)}-ADMIN")
  owners           = data.azuread_users.adgroup_owners.object_ids
  security_enabled = true
}

resource "azuread_group" "user_group" {
  count            = var.vm_config.count
  display_name     = lower("SEC-VM-${local.vm_config_name}-${format("%02s", count.index + 1)}-USER")
  owners           = data.azuread_users.adgroup_owners.object_ids
  security_enabled = true
}

resource "azurerm_role_assignment" "admin" {
  count                = var.vm_config.count
  scope                = data.azurerm_resource_group.rg.id
  role_definition_name = "Virtual Machine Administrator Login"
  principal_id         = azuread_group.admin_group[count.index].id
}

resource "azurerm_role_assignment" "user" {
  count                = var.vm_config.count
  scope                = data.azurerm_resource_group.rg.id
  role_definition_name = "Virtual Machine User Login"
  principal_id         = azuread_group.user_group[count.index].id
}
