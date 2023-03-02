/*# Add datasource for resource group
data "azurerm_resource_group" "rg" {
  name = "rg-${var.environment}-${var.location_short}-${var.common_name}"
}

data "azurerm_resource_group" "rg_core" {
  name = "rg-${var.environment}-${var.location_short}-${var.core_config.common_name}"
}
*/
resource "random_password" "vm_password" {
  count   = var.vm_config.count
  length  = 16
  special = true

  keepers = {
    vmPassword = var.vm_config.name

  }
}

/*
resource "azurerm_key_vault_secret" "vm_password" {
  count        = var.vm_config.count
  name         = "${local.vm_base_name}-${format("%02s", count.index + 1)}"
  value        = random_password.vm_password[count.index].result
  key_vault_id = data.azurerm_key_vault.kv.id
}

locals {
  vm_base_name      = "${var.environment_short}-${var.location_short}-${var.common_name_short}"
  vm_base_host_name = "${var.environment_short}-${var.location_short}-${var.common_name_short}"
  
}
*/

resource "azurerm_linux_virtual_machine" "vm" {
  count                           = var.vm_config.count
  name                            = var.vm_config.name
  location                        = var.location
  resource_group_name             = var.rg_name
  size                            = var.vm_config.size
  admin_username                  = var.vm_config.username
  admin_password                  = random_password.vm_password[count.index].result
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic[count.index].id
  ]

  identity {
    type = "SystemAssigned"
  }

  source_image_reference {
    publisher = var.vm_config.sourceImageReference.publisher
    offer     = var.vm_config.sourceImageReference.offer
    sku       = var.vm_config.sourceImageReference.sku
    version   = var.vm_config.sourceImageReference.version
  }

  os_disk {
    name                 = var.vm_config.storageOsDisk.name
    caching              = var.vm_config.storageOsDisk.caching
    storage_account_type = var.vm_config.storageOsDisk.storage_account_type

  }
}

resource "azurerm_network_interface" "nic" {
  count               = var.vm_config.count
  name                = var.vm_config.nic_name
  location            = var.rg_location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "ipconfig-01"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}
