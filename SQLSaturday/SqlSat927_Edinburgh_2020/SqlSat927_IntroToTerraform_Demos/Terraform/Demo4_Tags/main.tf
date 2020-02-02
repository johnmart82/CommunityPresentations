resource "azurerm_resource_group" "Demo-RG" {
  name     = var.ResourceGroupName
  location = var.ResourceGroupLocation

  tags = merge(local.common_tags)
}
