resource "tls_private_key" "ssh_admin_key" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

#tfsec:ignore:AZU023
resource "azurerm_key_vault_secret" "ssh_admin_key_secret" {
  name         = "${var.vm_config.name}-private-ssh"
  value        = jsonencode(tls_private_key.ssh_admin_key)
  key_vault_id = var.key_vault_id
  content_type = "x509"
}

resource "azurerm_network_interface" "nic" {
  name                = var.vm_config.nic_name
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "ipconfig-01"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                            = "${var.vm_config.name}"
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
    azurerm_network_interface.nic.id
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
