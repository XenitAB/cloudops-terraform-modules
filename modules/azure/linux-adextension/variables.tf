
variable "vm_config" {
  description = "Configuration of the virtual machines"
  type = object({
    name     = string
    count    = number
    username = string
    size     = string
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
    storage_os_disk = object({
      caching              = string
      disk_size_gb         = optional(string)
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
