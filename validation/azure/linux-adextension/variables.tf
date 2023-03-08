variable "common_name" {
  description = "The common name for this deployment"
  type        = string
}

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

variable "unique_suffix" {
  description = "Unique suffix that is used in globally unique resources names"
  type        = string
}

variable "vm_count" {
  description = "Count index"
  type        = number
}

variable "vm_config" {
  description = "Configuration of the virtual machines"
  type = object({
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
  })
}
variable "nic_name" {
  description = "The name of the Network Interface"
  type        = string
}

variable "rg_name" {
  description = "The name of the Resource Group"
  type        = string
}

variable "subnet_id" {
  description = "Subnet where the VM resides"
  type        = string

}
