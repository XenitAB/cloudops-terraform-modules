resource "tls_private_key" "ssh_admin_key" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

#tfsec:ignore:AZU023
resource "azurerm_key_vault_secret" "ssh_admin_key_secret" {
  name         = "${var.vm_config.name}-private-ssh"
  value        = trimspace(tls_private_key.ssh_admin_key.private_key_openssh)
  key_vault_id = var.key_vault_id
  content_type = "x509 string"
}

resource "azurerm_network_interface" "nic" {
  count               = var.vm_config.count
  name                = lower("${var.vm_config.name}-${format("%02s", count.index + 1)}")
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "private-ip-${format("%02s", count.index + 1)}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  count                           = var.vm_config.count
  name                            = lower("${var.vm_config.name}-${format("%02s", count.index + 1)}")
  location                        = var.location
  resource_group_name             = var.rg_name
  size                            = var.vm_config.size
  admin_username                  = var.vm_config.username
  disable_password_authentication = true
  admin_ssh_key {
    public_key                    = tls_private_key.ssh_admin_key.public_key_openssh
    username                      = var.vm_config.username
  }

  network_interface_ids = [
    azurerm_network_interface.nic[count.index].id
  ]

  identity {
    type = "SystemAssigned"
  }

  source_image_reference {
    publisher = var.vm_config.source_image_reference.publisher
    offer     = var.vm_config.source_image_reference.offer
    sku       = var.vm_config.source_image_reference.sku
    version   = var.vm_config.source_image_reference.version
  }

  os_disk {
    caching              = var.vm_config.storage_os_disk.caching
    storage_account_type = var.vm_config.storage_os_disk.storage_account_type
    disk_size_gb         = var.vm_config.storage_os_disk.disk_size_gb
  }

}
