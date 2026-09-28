terraform {
  required_version = ">= 1.7.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }

    local = {
      source = "hashicorp/local"
    }
  }
}

provider "azurerm" {
  features {}
}