

module "linux_adextension" {
  source = "../../../modules/azure/linux-adextension"

  vm_config = {
    size                 = var.vm_config.size
    publisher            = var.vm_config.publisher
    offer                = var.vm_config.offer
    sku                  = var.vm_config.sku
    version              = var.vm_config.version
    caching              = var.vm_config.caching
    storage_account_type = var.vm_config.storage_account_type
    disk_size_gb         = var.vm_config.disk_size_gb
    }
    username = "localadmin"
  }

  count = var.count

  nic_name = var.nic_name

  location = var.location

  rg_name = "rg-we-linux-foundation"

  subnet_id = "value"
}
