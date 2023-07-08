# Creamos un network sec group
resource "azurerm_network_security_group" "rg_cp2_nsg" {
  name                = "rg_cp2_nsc"
  location            = azurerm_resource_group.rg_cp2.location
  resource_group_name = azurerm_resource_group.rg_cp2.name

  security_rule       = [
    {
      access                                     = "Allow"
      description                                = "Acceso via SSG"
      destination_address_prefix                 = ""
      destination_address_prefixes               = [azurerm_network_interface.rg_cp2_nic_vmdocker.ip_configuration[0].private_ip_address]
      destination_application_security_group_ids = []
      destination_port_range                     = "22"
      destination_port_ranges                    = []
      direction                                  = "Inbound"
      name                                       = "SSH"
      priority                                   = 1001
      protocol                                   = "Tcp"
      source_address_prefix                      = "0.0.0.0/0"
      source_address_prefixes                    = []
      source_application_security_group_ids      = []
      source_port_range                          = "22"
      source_port_ranges                         = []
    }
  ]
}
