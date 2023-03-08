terraform {
  required_version = "1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.8.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.19.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.4"
    }
  }
}

data "azurerm_subscription" "current" {}
data "azurerm_client_config" "current" {}
