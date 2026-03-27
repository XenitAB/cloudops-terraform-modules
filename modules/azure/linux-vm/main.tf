terraform {
  required_version = "1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.66.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.8.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.8.1"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.2.1"
    }
  }
}
