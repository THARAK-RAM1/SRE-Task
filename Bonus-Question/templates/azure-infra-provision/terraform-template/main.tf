provider "azurerm" {
  features {}
  #
  location = "westeurope"
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "westeurope"

  tags = var.resource_group_tag
}

resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.storage_account_resource_group
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = replace(var.sku, "Standard_", "")

  access_tier = var.access_tier

  tags = var.storage_account_tag
}

resource "azurerm_storage_container" "container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = var.container_type
}

