terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

module "sre_storage" {
  source = "./modules/storage"

  resource_group_name      = var.resource_group_name
  location                 = var.location
  tags                     = var.tags
  storage_account_name     = var.storage_account_name
  storage_container_name   = var.storage_container_name
  container_access_type    = var.container_access_type
}
