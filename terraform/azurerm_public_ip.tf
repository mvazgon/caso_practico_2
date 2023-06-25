# Definimos las IP privadas y publicas para y recuperamos sus valores. 
# Definicion de las direcciones IP de la máquina virtual vmdocker
resource "azurerm_public_ip" "rg_cp2_public_ip_vmdocker" {
  name                = "rg_cp2_public_ip_vmdocker"
  location            = var.location
  resource_group_name = var.name_rg
  allocation_method   = "Dynamic"
}

#Definición de las direcciones IP de la máquina virtual ansible.
resource "azurerm_public_ip" "rg_cp2_public_ip_vmansible" {
  name                = "rg_cp2_public_ip_vmansible"
  location            = var.location
  resource_group_name = var.name_rg
  allocation_method   = "Dynamic"
}

