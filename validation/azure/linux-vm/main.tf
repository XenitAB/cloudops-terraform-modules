module "linux_adextension" {
  source = "../../../modules/azure/linux-vm"

  location_short  = "we"
  location        = "test"
  environment     = "test"
  rg_name         = "test"
  ad_group_owners = ["owner.user@example.com"]
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
      subnet_id            = "value"
      key_vault_id         = "test"
    },
  ]

}
