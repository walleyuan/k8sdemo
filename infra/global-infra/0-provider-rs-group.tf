provider "azurerm" {
  version = ">= 2.0"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.az_rm["az_group_name"]
  location = var.az_rm["az_region"]
}