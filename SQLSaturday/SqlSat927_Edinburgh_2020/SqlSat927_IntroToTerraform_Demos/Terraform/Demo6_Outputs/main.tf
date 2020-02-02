resource "azurerm_resource_group" "Demo-RG" {
    name = var.ResourceGroupName
    location = var.ResourceGroupLocation

    tags = merge(local.common_tags)
}

resource "azurerm_storage_account" "Demo-StorageAcc" {
  name = var.AzStorageAccountName
  location = azurerm_resource_group.Demo-RG.location
  resource_group_name = azurerm_resource_group.Demo-RG.name

  account_tier = var.StorageAccountTier
  account_replication_type = var.StorageAccountReplType

  tags = merge(local.common_tags)
}
