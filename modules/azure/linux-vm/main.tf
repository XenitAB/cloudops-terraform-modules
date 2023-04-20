terraform {
  required_version = "1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.54.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.38.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.4"
    }
  }
}

data "azuread_users" "adgroup_owners" {
  user_principal_names = var.adgroup_owners
  
} 

# ad_group_owners = ["user.name@example.com", "user.name_2@example_2.com"]
