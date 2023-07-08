/*
Creamos la subnet donde se conectarán los objetos de NIC de las futuras MV
Es una subred local.
*/
resource "azurerm_subnet" "rg_cp2_network_subnet0"{

  name = "rg_cp2_network_subnet"
  resource_group_name = azurerm_resource_group.rg_cp2.name
  virtual_network_name = azurerm_virtual_network.rg_cp2_network.name
  address_prefixes = ["192.168.254.0/28"]

}
