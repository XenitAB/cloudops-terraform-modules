resource "azurerm_network_interface" "nic" {
  for_each = {
    for name in var.vm_config :
    vm_config.name => name
  }
  name                = "nic-${each.value.vm_config.name}"
  location            = var.location
  resource_group_name = var.vm_config[each.key].rg_name

  ip_configuration {
    name                          = "private-ip-${each.value.vm_config.name}"
    subnet_id                     = var.vm_config[each.key].subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}
