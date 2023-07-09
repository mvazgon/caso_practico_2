/*
Creamos las nic que asignaremos a las VM
NIC vmdocker
Establecemos el valor de la IP pública definida en el objeto azurerm_public_ip
*/
resource "azurerm_network_interface" "rg_cp2_nic_vmdocker" {
  name                = "rg_cp2_nic_vmdocker"
  location            = azurerm_resource_group.rg_cp2.location
  resource_group_name = azurerm_resource_group.rg_cp2.name

  ip_configuration {
    name                          = "rg_cp2_nic_vmdocker"
    subnet_id                     = azurerm_subnet.rg_cp2_network_subnet0.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.rg_cp2_public_ip_vmdocker.id
  }
}
/*
#NIC vmansible
resource "azurerm_network_interface" "rg_cp2_nic_vmansible" {
  name                = "rg_cp2_nic_vmansible"
  location            = azurerm_resource_group.rg_cp2.location
  resource_group_name = azurerm_resource_group.rg_cp2.name

  ip_configuration {
    name                          = "rg_cp2_nic_vmansible"
    subnet_id                     = azurerm_subnet.rg_cp2_network_subnet0.id
    private_ip_address_allocation = "Dynamic"
  }
}
*/