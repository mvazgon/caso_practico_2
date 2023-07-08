/*
 Definimos las IP privadas y publicas para y recuperamos sus valores. 
 Definicion de las direcciones IP de la máquina virtual vmdocker
*/

/*
Definición del objeto IP publica para la máquina expuesta a internet.
*/
resource "azurerm_public_ip" "rg_cp2_public_ip_vmdocker" {
  name                = "rg_cp2_public_ip_vmdocker"
  location            = azurerm_resource_group.rg_cp2.location
  resource_group_name = azurerm_resource_group.rg_cp2.name
  allocation_method   = "Dynamic"
}

