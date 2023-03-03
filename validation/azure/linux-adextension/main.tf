terraform {}

provider "azurerm" {
  features {}
}

provider "azuread" {}

module "linux_adextension" {
  source = "../../../modules/azure/linux-adextension"
  vm_config = {
    name     = "linuxserver"
    size     = "value"
    nic_name = "value"
    sourceImageReference = {
      offer     = "value"
      publisher = "value"
      sku       = "value"
      version   = "value"
    }
    storageOsDisk = {
      name                 = "value"
      caching              = "value"
      disk_size_gb         = "value"
      storage_account_type = "value"
    }
    username = "value"
  }

  location = "westeurope"

  rg_name = "rg-we-linux-foundation"

  subnet_id = "value"

  key_vault_id = "value"
}
