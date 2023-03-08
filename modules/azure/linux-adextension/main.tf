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

provider "azurerm" {
  features {}
}

/* #reference to xenit core-module
provider "azuread" {}

module "core" {
  source = "github.com/xenitab/terraform-modules//modules/azure/core?ref=2022.05.4"

  environment                  = var.environment
  location_short               = var.location_short
  subscription_name            = var.subscription_name
  name                         = var.core_name
  vnet_config                  = var.vnet_config
  peering_config               = var.peering_config
  route_config                 = var.route_config
  azure_ad_group_prefix        = var.azure_ad_group_prefix
  azure_role_definition_prefix = var.azure_role_definition_prefix
}
*/