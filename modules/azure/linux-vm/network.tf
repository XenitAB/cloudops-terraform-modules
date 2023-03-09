resource "azurerm_network_interface" "nic" {
  for_each = {
    for vm in var.vm_config :
    vm.vm_name => vm
  }
  name                = "nic-${var.environment}-${var.location_short}-${each.value.vm_name}"
  location            = var.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = "ipconfig-${var.environment}-${var.location_short}-${each.value.vm_name}"
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}
