data "azuread_users" "adgroup_owners" {
  user_principal_names = var.adgroup_owners
  
} 

# To get the type handler version run
# az vm extension image list --location westeurope --output table
resource "azurerm_virtual_machine_extension" "aad_ssh_login_for_linux" {

  name                 = "AADSSHLoginForLinux"
  virtual_machine_id   = azurerm_linux_virtual_machine.vm.id
  publisher            = "Microsoft.Azure.ActiveDirectory"
  type                 = "AADSSHLoginForLinux"
  type_handler_version = "1.0"

resource "azuread_group" "group_admins" {

  display_name     = lower("SEC-VM-${local.vm_base_name}-ADMIN")
  owners           = data.azuread_users.adgroup_owners.object_ids
  security_enabled = true
}

resource "azuread_group" "group_users" {

  display_name     = lower("SEC-VM-${local.vm_base_name}-USER")
  owners           = data.azuread_users.adgroup_owners.object_ids
  security_enabled = true
}

resource "azurerm_role_assignment" "admin" {

  scope                = data.azurerm_resource_group.rg.id
  role_definition_name = "Virtual Machine Administrator Login"
  principal_id         = azuread_group.prtlwrk_admin.id
}

resource "azurerm_role_assignment" "user" {

  scope                = data.azurerm_resource_group.rg.id
  role_definition_name = "Virtual Machine User Login"
  principal_id         = azuread_group.prtlwrk_user.id
}

