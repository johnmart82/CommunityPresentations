terraform {
  backend "azurerm" {
    resource_group_name  = "SqlSat927-TF-Backend-RG"
    storage_account_name = "sqlsat927tfbackend"
    container_name       = "sqlsat927"
    key                  = "demo2.terraform.tfstate"
  }
}
