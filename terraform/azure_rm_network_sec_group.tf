# Creamos un network sec group
resource "azurerm_network_security_group" "rg_cp2_nsg" {
  name                = "rg_cp2_nsc"
  location            = var.location
  resource_group_name = var.name_rg

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name = "HTTP"
    priority = 1001
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    description = "80"
    source_address_prefix = "*"
    destination_address_prefix = "*"
  }

}