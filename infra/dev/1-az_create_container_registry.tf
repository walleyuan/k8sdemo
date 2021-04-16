resource "azurerm_container_registry" "acr" {
  name                     = var.az_container["az_registry_name"]
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  sku                      = var.az_container["az_sku"]
  admin_enabled            = false
}