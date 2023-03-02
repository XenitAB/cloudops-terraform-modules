
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
  description = ""
  type        = string
}

variable "rg_location" {
  description = ""
  type        = string
}

variable "common_name" {
  description = "The commonName to use for the deploy"
  type        = string
}

variable "common_name_short" {
  description = "Short commonName to use as VM hostname"
  type        = string
}

variable "location" {
  description = "The Azure region to create things in."
  type        = string
}

variable "location_short" {
  description = "The Azure region short name."
  type        = string
}

variable "environment" {
  description = "The environment of the Azure resource, prod, test, uat."
  type        = string
}

variable "environment_short" {
  description = "The environment of the Azure resource, p = prod, t = test u = uat."
  type        = string
}

variable "core_config" {
  description = "The configuration of the core infra"
  type = object({
    common_name = string
    subnet_name = string
  })
}

variable "subnet_id" {
  description = "Subnet where the VM recide in"
  type        = string

}