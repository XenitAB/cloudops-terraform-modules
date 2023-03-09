
variable "location" {
  description = "The Azure region name"
  type        = string
}

variable "location_short" {
  description = "The Azure region short name"
  type        = string
}

variable "environment" {
  description = "The environment name to use for the deploy"
  type        = string
}


variable "vm_config" {
  description = "Configuration of the virtual machines"
  type = list(
    object({
      name                 = string
      username             = string
      size                 = string
      publisher            = string
      offer                = string
      sku                  = string
      version              = string
      caching              = string
      disk_size_gb         = optional(string)
      storage_account_type = string
      rg_name              = string
      nic_name             = string
      subnet_id            = string
      ip_config_name       = string
      key_vault_id         = string
      ssh_key_name         = string
    })
  )
}
