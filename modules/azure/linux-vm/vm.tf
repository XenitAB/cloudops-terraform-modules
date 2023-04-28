
resource "azurerm_linux_virtual_machine" "vm" {
  for_each = {
    for vm in var.vm_config :
    vm.vm_name => vm
  }
  name                            = "vm-${var.environment}-${var.location_short}-${each.value.vm_name}"
  location                        = var.location
  resource_group_name             = var.rg_name
  size                            = each.value.size
  admin_username                  = each.value.username
  disable_password_authentication = true
  admin_ssh_key {
    public_key = tls_private_key.ssh_admin_key[each.key].public_key_openssh
    username   = each.value.username
  }

  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id
  ]

  identity {
    type = "SystemAssigned"
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }

  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
    disk_size_gb         = each.value.disk_size_gb
  }

}
