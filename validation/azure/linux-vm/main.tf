module "linux_adextension" {
  source = "../../../modules/azure/linux-vm"

  location_short = "we"
  location       = "test"
  environment    = "test"


  vm_config = [
    {
      vm_name              = "vm-01"
      size                 = "test"
      publisher            = "test"
      offer                = "test"
      sku                  = "test"
      version              = "test"
      caching              = "test"
      storage_account_type = "SSD"
      disk_size_gb         = 64
      username             = "localadmin"
      nic_name             = "vm-nic"
      rg_name              = "rg-dev-we-linux"
      subnet_id            = "value"
      key_vault_id         = "test"
    },
    {
      vm_name              = "vm-02"
      size                 = "test"
      publisher            = "test"
      offer                = "test"
      sku                  = "test"
      version              = "test"
      caching              = "test"
      storage_account_type = "SSD"
      disk_size_gb         = 64
      username             = "localadmin"
      nic_name             = "vm-nic"
      rg_name              = "rg-qa-we-linux"
      subnet_id            = "value"
      key_vault_id         = "test"
    },
  ]

}
