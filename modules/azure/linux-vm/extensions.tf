
# To get the type handler version run
# az vm extension image list --location westeurope --output table
resource "azurerm_virtual_machine_extension" "aad_ssh_login_for_linux" {
  for_each = {
    for vm in var.vm_config :
    vm.vm_name => vm
  }
  name                 = "AADSSHLoginForLinux"
  virtual_machine_id   = azurerm_linux_virtual_machine.vm[each.key].id
  publisher            = "Microsoft.Azure.ActiveDirectory"
  type                 = "AADSSHLoginForLinux"
  type_handler_version = "1.0"

}

resource "azuread_group" "group_admins" {
  display_name     = "sec-${var.rg_name}-vmadmin"
  owners           = data.azuread_users.ad_group_owners.object_ids
  security_enabled = true
}

resource "azuread_group" "group_users" {
  display_name     = "sec-${var.rg_name}-vmuser"
  owners           = data.azuread_users.ad_group_owners.object_ids
  security_enabled = true
}

resource "azurerm_role_assignment" "role_admin" {
  scope                = data.azurerm_resource_group.rg.id
  role_definition_name = "Virtual Machine Administrator Login"
  principal_id         = azuread_group.group_admins.id
}

resource "azurerm_role_assignment" "role_user" {
  scope                = data.azurerm_resource_group.rg.id
  role_definition_name = "Virtual Machine User Login"
  principal_id         = azuread_group.group_users.id
}

