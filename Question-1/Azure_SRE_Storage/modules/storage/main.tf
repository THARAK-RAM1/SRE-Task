resource "azurerm_resource_group" "sre_rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_storage_account" "sre_storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.sre_rg.name
  location                 = azurerm_resource_group.sre_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  access_tier              = "Hot"
  tags                     = var.tags
}

resource "azurerm_storage_container" "sre_container" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.sre_storage.name
  container_access_type = var.container_access_type
}
