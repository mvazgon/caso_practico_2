resource "azurerm_container_registry" "rgcp2acrmvg" {
  name                = "rgcp2acrmvg"
  resource_group_name = azurerm_resource_group.rg_cp2.name
  location            = azurerm_resource_group.rg_cp2.location
  sku                 = "Basic"
  admin_enabled       = true
}