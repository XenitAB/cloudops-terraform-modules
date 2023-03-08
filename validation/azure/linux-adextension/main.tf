module "linux_adextension" {
  source = "../../../modules/azure/linux-adextension"

  unique_suffix  = "1234"
  common_name    = "test"
  location_short = "we"
  environment    = "test"


  vm_config = {
    size                 = "test"
    publisher            = "test"
    offer                = "test"
    sku                  = "test"
    version              = "test"
    caching              = "test"
    storage_account_type = "SSD"
    disk_size_gb         = 128
    username             = "localadmin"
  }

  vm_count  = 1
  nic_name  = "vm-nic"
  location  = "West Europe"
  rg_name   = "rg-dev-we-linux"
  subnet_id = "value"
}
