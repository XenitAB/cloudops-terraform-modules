
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
variable "rg_name" {
  description = "The workload resource group"
  type        = string
}

variable "vm_config" {
  description = "Configuration of the virtual machines"
  type = list(
    object({
      vm_name              = string
      username             = string
      size                 = string
      publisher            = string
      offer                = string
      sku                  = string
      version              = string
      caching              = string
      disk_size_gb         = optional(string)
      storage_account_type = string
      nic_name             = string
      subnet_id            = string
      key_vault_id         = string
    })
  )
}

variable "ad_group_owners" {
  description = "A list of owners for the AD-group that allows Linux VM admin access"
  type        = list(string)
}
