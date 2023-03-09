resource "azurerm_network_interface" "nic" {
  for_each = {
    for name in var.vm_config :
    vm_config.name => name
  }
  name                = var.vm_config[each.key].nic_name
  location            = var.location
  resource_group_name = var.vm_config[each.key].rg_name

  ip_configuration {
    name                          = var.vm_config[each.key].ip_config_name
    subnet_id                     = var.vm_config[each.key].subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}
