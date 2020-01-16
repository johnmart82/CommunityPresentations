## Variables requiring input
#########################
variable "AzureSubscriptionId" {
  description = "Please provide the GUID for the target Azure Subscription for resource creation."
}
variable "Tag_CreatedDate" {
  description = "Please provide the date of creation for this resource, format - yyyymmdd"
}
variable "Tag_Usage" {
  description = "Please provide the reason that this resource has been created."
}

variable "AzureResourceGroupName" {
  description = "Please provide the name of the resource group for resource creation."
}
variable "AzureRegion" {
  description = "Please procide the name of the Azure region to create resources in."
}

variable "AzureStorageAccountName" {
  description = "Please provide a name for the Azure Storage Account to be created."
}
variable "AzureStorageContainerNamePrefix" {
  description = "Please provide the prefix name of containers to be created."
}
variable "AzureStorageContainerCount" {
  description = "Please provide the number of containers to create."
}

## Variables with supplied defaults
#########################
variable "AzureStorageAccountTier" {
  description = "Please provide the Storage Account Tier name. Default: Standard"
  default     = "Standard"
}
variable "AzureStorageAccountReplicationType" {
  description = "Please provide the storage account replication type name. Default: LRS"
  default     = "LRS"
}
variable "AzureStorageAccountKind" {
  description = "Please provide the storage account kind name. Default: StorageV2"
  default     = "StorageV2"
}
variable "AzureStorageContainerAccessType" {
  description = "Please provide the Azure Storage Container Access type. Default: private"
  default     = "private"
}
variable "Tag_AutoCleanUp" {
  description = "Please proivide confirmation whether this resource can be cleaned up automatically, Yes/No."
  default     = "No"
}