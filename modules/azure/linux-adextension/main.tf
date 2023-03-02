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
  }
}

provider "azurerm" {
  features {}
}