terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.67.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "qa001tfstate"
    container_name       = "tfstate"
    key                  = "qa.tfstate"
  }
}

provider "azurerm" {
  features {}
}
