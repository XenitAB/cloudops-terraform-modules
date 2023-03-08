resource "azurerm_network_interface" "nic" {
  count               = var.vm_count
  name                = lower("${var.nic_name}-${format("%02s", count.index + 1)}")
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "private-ip-${var.nic_name}-${format("%02s", count.index + 1)}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}
