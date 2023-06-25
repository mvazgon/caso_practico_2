#Creamos las nic que asignaremos a las VM
#NIC vmdocker
resource "azurerm_network_interface" "rg_cp2_nic_vmdocker" {
  name                = "rg_cp2_nic_vmdocker"
  location            = var.location
  resource_group_name = var.name_rg

  ip_configuration {
    name                          = "rg_cp2_nic_vmdocker"
    #subnet_id                     = azurerm_subnet.rg_cp2_network.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.rg_cp2_public_ip_vmdocker.id
  }
}

#NIC vmansible
resource "azurerm_network_interface" "rg_cp2_nic_vmansible" {
  name                = "rg_cp2_nic_vmansible"
  location            = var.location
  resource_group_name = var.name_rg

  ip_configuration {
    name                          = "rg_cp2_nic_vmansible"
    #subnet_id                     = azurerm_subnet.my_terraform_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.rg_cp2_public_ip_vmansible.id
  }
}
