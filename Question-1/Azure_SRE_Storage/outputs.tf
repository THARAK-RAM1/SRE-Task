output "storage_account_id" {
  value = module.sre_storage.storage_account_id
}

output "storage_account_primary_access_key" {
  value     = module.sre_storage.primary_access_key
  sensitive = true
}

output "storage_account_primary_connection_string" {
  value     = module.sre_storage.primary_connection_string
  sensitive = true
}

output "container_id" {
  value = module.sre_storage.container_id
}
