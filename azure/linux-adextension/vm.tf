
resource "azurerm_linux_virtual_machine" "vm" {
  count                           = var.count
  name                            = "vm-${var.environment}-${var.location_short}-${var.common_name}-${format("%02s", count.index + 1)}")
  location                        = var.location
  resource_group_name             = var.rg_name
  size                            = var.vm_config.size
  admin_username                  = var.vm_config.username
  disable_password_authentication = true
  admin_ssh_key {
    public_key = tls_private_key.ssh_admin_key.public_key_openssh
    username   = var.vm_config.username
  }

  network_interface_ids = [
    azurerm_network_interface.nic[count.index].id
  ]

  identity {
    type = "SystemAssigned"
  }

  source_image_reference {
    publisher = var.vm_config.publisher
    offer     = var.vm_config.offer
    sku       = var.vm_config.sku
    version   = var.vm_config.version
  }

  os_disk {
    caching              = var.vm_config.caching
    storage_account_type = var.vm_config.storage_account_type
    disk_size_gb         = var.vm_config.disk_size_gb
  }

}
