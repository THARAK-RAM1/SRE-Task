output "storage_account_id" {
  value = azurerm_storage_account.storage.id
}

output "storage_account_primary_access_key" {
  value = azurerm_storage_account.storage.primary_access_key
}

output "storage_account_primary_connection_string" {
  value = azurerm_storage_account.storage.primary_connection_string
}

output "container_id" {
  value = azurerm_storage_container.container.id
}

