#Creamos la virtual network bajo el resource_group anterior
resource "azurerm_virtual_network" "rg_cp2_network" {
  name = "rg_cp2_network"
  resource_group_name = var.name_rg
  location            = var.location
  address_space       = ["192.168.254.0/24"]
}