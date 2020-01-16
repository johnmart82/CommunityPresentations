## Create resource group to hold our Storage Account
resource "azurerm_resource_group" "IgniteTourLdn2020_01" {
  name     = var.AzureResourceGroupName
  location = var.AzureRegion

  tags = merge(local.common_tags)
}

resource "azurerm_storage_account" "StorageAccountIgniteTourLdn2020" {
  name                     = var.AzureStorageAccountName
  resource_group_name      = azurerm_resource_group.IgniteTourLdn2020_01.name
  location                 = azurerm_resource_group.IgniteTourLdn2020_01.location
  account_tier             = var.AzureStorageAccountTier
  account_replication_type = var.AzureStorageAccountReplicationType
  account_kind             = var.AzureStorageAccountKind

  tags = merge(local.common_tags)
}

resource "azurerm_storage_container" "StorageContainerIgniteTourLdn2020" {
  name                  = "${var.AzureStorageContainerNamePrefix}${count.index}"
  storage_account_name  = azurerm_storage_account.StorageAccountIgniteTourLdn2020.name
  container_access_type = var.AzureStorageContainerAccessType

  count = var.AzureStorageContainerCount
}

resource "azurerm_storage_management_policy" "StoragePolicyIgniteTourLdn2020" {
  storage_account_id = azurerm_storage_account.StorageAccountIgniteTourLdn2020.id

  rule {
    name    = "Default"
    enabled = true
    filters {
      blob_types = ["blockBlob"]
    }
    actions {
      base_blob {
        tier_to_cool_after_days_since_modification_greater_than    = 1
        tier_to_archive_after_days_since_modification_greater_than = 2
        delete_after_days_since_modification_greater_than          = 90
      }
      snapshot {
        delete_after_days_since_creation_greater_than = 35
      }
    }
  }

  rule {
    name    = "ImmediateArchive"
    enabled = true
    filters {
      blob_types   = ["blockBlob"]
      prefix_match = ["container1"]
    }
    actions {
      base_blob {
        tier_to_archive_after_days_since_modification_greater_than = 0
      }
      snapshot {
        delete_after_days_since_creation_greater_than = 7
      }
    }
  }

  rule {
    name    = "DataPurge"
    enabled = true
    filters {
      blob_types   = ["blockBlob"]
      prefix_match = ["container2"]
    }
    actions {
      base_blob {
        delete_after_days_since_modification_greater_than = 5
      }
    }
  }

}
