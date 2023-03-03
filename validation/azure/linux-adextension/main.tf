terraform {}

provider "azurerm" {
  features {}
}

provider "azuread" {}

module "linux_adextension" {
  source = "../../../modules/azure/linux-adextension"
  vm_config = {
    count    = 1
    name     = "value"
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

  location       = "westeurope"
  location_short = "we"

  rg_name     = "value"
  rg_location = "we"

  environment       = "dev"
  environment_short = "d"

  common_name       = "name"
  common_name_short = "n"

  subnet_id = "value"

}
