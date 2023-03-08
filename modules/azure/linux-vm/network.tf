resource "azurerm_network_interface" "nic" {
  count               = var.vm_count
  name                = "nic-${each.value.common_name}"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "private-ip-${each.value.common_name}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}
