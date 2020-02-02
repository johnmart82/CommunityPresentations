resource "azurerm_resource_group" "Demo-RG" {
    name = "${var.ResourceGroupName}"
    location = var.ResourceGroupLocation
}
