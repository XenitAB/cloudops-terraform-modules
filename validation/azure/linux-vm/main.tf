module "linux_adextension" {
  source = "../../../modules/azure/linux-vm"

  location_short = "we"
  location       = "test"
  environment    = "test"


  vm_config = [
    {
      name                 = "vm-01"
      size                 = "test"
      publisher            = "test"
      offer                = "test"
      sku                  = "test"
      version              = "test"
      caching              = "test"
      storage_account_type = "SSD"
      disk_size_gb         = 128
      username             = "localadmin"
      nic_name             = "vm-nic"
      location             = "West Europe"
      rg_name              = "rg-dev-we-linux"
      subnet_id            = "value"
      key_vault_id         = "test"
      ssh_key_name         = "test"
      ip_config_name       = "test"
    },
    {
      name                 = "vm-02"
      size                 = "test"
      publisher            = "test"
      offer                = "test"
      sku                  = "test"
      version              = "test"
      caching              = "test"
      storage_account_type = "SSD"
      disk_size_gb         = 128
      username             = "localadmin"
      nic_name             = "vm-nic"
      location             = "West Europe"
      rg_name              = "rg-dev-we-linux"
      subnet_id            = "value"
      key_vault_id         = "test"
      ssh_key_name         = "test"
      ip_config_name       = "test"
    },
  ]

}
