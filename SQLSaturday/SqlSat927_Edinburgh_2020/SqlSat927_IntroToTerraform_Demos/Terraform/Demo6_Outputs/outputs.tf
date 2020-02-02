output "StorageAccID" {
  value = azurerm_storage_account.Demo-StorageAcc.identity
}

output "StorageAccPrimaryAccessKey" {
  value = azurerm_storage_account.Demo-StorageAcc.primary_access_key
}

output "StorageAccPrimaryConnectionString" {
  value = azurerm_storage_account.Demo-StorageAcc.primary_connection_string
}