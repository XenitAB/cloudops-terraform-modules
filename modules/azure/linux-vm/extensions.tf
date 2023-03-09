
#      ad_group_owners = ["user.name@example.com", "user.name_2@example_2.com"]

#      ad_group_owners = ["user.name@example.com", "user.name_2@example_2.com"]

# To get the type handler version run
# az vm extension image list --location westeurope --output table
resource "azurerm_virtual_machine_extension" "aad_ssh_login_for_linux" {
  for_each = {
    for vm in var.vm_config :
    vm.vm_name => vm
  }
  name                 = "AADSSHLoginForLinux"
  virtual_machine_id   = azurerm_linux_virtual_machine.vm.id
  publisher            = "Microsoft.Azure.ActiveDirectory"
  type                 = "AADSSHLoginForLinux"
  type_handler_version = "1.0"

}

resource "azuread_group" "group_admins" {
  for_each = {
    for vm in var.vm_config :
    vm.vm_name => vm
  }
  display_name     = lower("SEC-VM-${local.vm_base_name}-ADMIN")
  owners           = data.azuread_users.adgroup_owners.object_ids
  security_enabled = true
}

resource "azuread_group" "group_users" {
  for_each = {
    for vm in var.vm_config :
    vm.vm_name => vm
  }
  display_name     = lower("SEC-VM-${local.vm_base_name}-USER")
  owners           = data.azuread_users.adgroup_owners.object_ids
  security_enabled = true
}

resource "azurerm_role_assignment" "role_admin" {
<<<<<<< HEAD
  for_each = {
    for vm in var.vm_config :
    vm.vm_name => vm
  }
=======

>>>>>>> creation of AD-extension in extensions.tf
  scope                = data.azurerm_resource_group.rg.id
  role_definition_name = "Virtual Machine Administrator Login"
  principal_id         = azuread_group.group_admins.id
}

resource "azurerm_role_assignment" "role_user" {
<<<<<<< HEAD
  for_each = {
    for vm in var.vm_config :
    vm.vm_name => vm
  }
=======

>>>>>>> creation of AD-extension in extensions.tf
  scope                = data.azurerm_resource_group.rg.id
  role_definition_name = "Virtual Machine User Login"
  principal_id         = azuread_group.group_users.id
}

