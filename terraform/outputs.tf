data "azurerm_public_ip" "rg_cp2_public_ip_vmdocker" {
  name                  = azurerm_public_ip.rg_cp2_public_ip_vmdocker.name
  resource_group_name   = azurerm_resource_group.rg_cp2.name
}

output "rg_id" {
  value = azurerm_resource_group.rg_cp2.id
}

output "rg_location" {
    value               =  azurerm_resource_group.rg_cp2.location
}
output "virtual_network_id" {
    value               = azurerm_virtual_network.rg_cp2_network.id
}

output "virtual_subnet_id"{
    value               = azurerm_subnet.rg_cp2_network_subnet0.id
}

output "virtual_public_ip_vmdocker" {
    value               = data.azurerm_public_ip.rg_cp2_public_ip_vmdocker.ip_address
}

output "virtual_fqdn_vmdocker" {
    value               = data.azurerm_public_ip.rg_cp2_public_ip_vmdocker.fqdn
}

/*
output "virtual_sec_group_id" {
    value =   azurerm_network_security_group.rg_cp2_nsg.id
}

output "ssh_private_key" {
    value = tls_private_key.rg_cp2_ssh_key.private_key_pem
}

output "ssh_public_key" {
    value = tls_private_key.rg_cp2_ssh_key.public_key_pem
}
*/