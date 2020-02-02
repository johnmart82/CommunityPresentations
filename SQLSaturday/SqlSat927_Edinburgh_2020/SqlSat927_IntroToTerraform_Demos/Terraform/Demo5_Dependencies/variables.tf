variable "ResourceGroupName" {
  type        = string
  description = "Please provide a name for the resource group."
}
variable "ResourceGroupLocation" {
  type        = string
  description = "Please provide an Azure region for the resource group."
}
variable "AzureSubScriptionID" {
  type        = string
  description = "Please provide a subscription ID for resource deployment."
  default     = "00000000-0000-0000-0000-000000000000"
}
variable "AzStorageAccountName" {
  type        = string
  description = "Please provide the name of the storage account to create."
}
variable "StorageAccountTier" {
  type        = string
  description = "Please provide the storage account tier to use (Standard|Premium)"
}

variable "StorageAccountReplType" {
  type        = string
  description = "Please provide the type of storage replication to use (LRS|GRS|RAGRS|ZRS)"
}


# Variables that need to be supplied for the tags.
variable "CostCentre" {
  description = "Please provide a cost center for the resource to be allocated to."
}

variable "Environment" {
  description = "Please provide details on the environment that the resource is assigned to."
}

variable "Contact" {
  description = "Please provide a contact that is responsible for this resource, this should be a valid distribution email list."
}

variable "Usage" {
  description = "Please provide some context for what the resources are being used for."
}
variable "CreatedDate" {
  type        = string
  description = "Please provide the date for resource creation tag."
}
