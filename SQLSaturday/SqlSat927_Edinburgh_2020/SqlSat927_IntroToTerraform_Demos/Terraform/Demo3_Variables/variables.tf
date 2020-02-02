variable "ResourceGroupName" {
  type = string
  description = "Please provide a name for the resource group."
}
variable "ResourceGroupLocation" {
  type = string
  description = "Please provide an Azure region for the resource group."
}
variable "AzureSubScriptionID" {
    type = string
    description = "Please provide a subscription ID for resource deployment."
    default = "00000000-0000-0000-0000-000000000000"
}