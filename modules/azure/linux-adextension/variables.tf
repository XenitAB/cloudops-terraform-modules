
variable "vm_config" {
  description = "Configuration of the virtual machines"
  type = object({
    count    = number
    name     = string
    username = string
    size     = string
    nic_name = string
    sourceImageReference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
    storageOsDisk = object({
      name                 = string
      caching              = string
      disk_size_gb         = string
      storage_account_type = string
    })
  })
}

variable "rg_name" {
  description = "The name of the Resource Group"
  type        = string
}

variable "location" {
  description = "The Azure region to create things in"
  type        = string
}

variable "subnet_id" {
  description = "Subnet where the VM resides"
  type        = string

}

variable "key_vault_id" {
  description = "The key vault id"
  type        = string

}
