
resource "azurerm_linux_virtual_machine" "vm" {
  for_each = {
    for name in var.vm_config :
    name.vm_config => name
  }
  name                            = "vm-${var.environment}-${var.location_short}-${each.value.vm_config.name}"
  location                        = var.location
  resource_group_name             = var.vm_config[each.key].rg_name
  size                            = var.vm_config[each.key].size
  admin_username                  = var.vm_config[each.key].username
  disable_password_authentication = true
  admin_ssh_key {
    public_key = tls_private_key.ssh_admin_key[each.key].public_key_openssh
    username   = var.vm_config[each.key].username
  }

  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id
  ]

  identity {
    type = "SystemAssigned"
  }

  source_image_reference {
    publisher = var.vm_config[each.key].publisher
    offer     = var.vm_config[each.key].offer
    sku       = var.vm_config[each.key].sku
    version   = var.vm_config[each.key].version
  }

  os_disk {
    caching              = var.vm_config[each.key].caching
    storage_account_type = var.vm_config[each.key].storage_account_type
    disk_size_gb         = var.vm_config[each.key].disk_size_gb
  }

}
