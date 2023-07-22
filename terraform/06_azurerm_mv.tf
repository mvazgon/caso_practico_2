# Create virtuals machines

#Definimos la VM que ejecutará los workload de docker/podman de vmdocker01
resource "azurerm_linux_virtual_machine" "rg_cp2_vmdocker" {
  name                            = "rg_cp2_vmdocker"
  location                        = azurerm_resource_group.rg_cp2.location
  resource_group_name             = azurerm_resource_group.rg_cp2.name
  network_interface_ids           = [azurerm_network_interface.rg_cp2_nic_vmdocker.id]
  size                            = "Standard_DS2_v2"
  computer_name                   = "vmdocker01"
  admin_username                  = "azureuser"
  disable_password_authentication = true

  os_disk {
    name                 = "myOsDiskvmansible"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
 
  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }
}
/*
#Definición de la MV vmansible01
resource "azurerm_linux_virtual_machine" "rg_cp2_vmansible"{
  name                            = "rg_cp2_vmansible"
  location                        = azurerm_resource_group.rg_cp2.location
  resource_group_name             = azurerm_resource_group.rg_cp2.name
  network_interface_ids           = [azurerm_network_interface.rg_cp2_nic_vmansible.id]
  size                            = "Standard_B1ls"
  computer_name                   = "vmansible01"
  admin_username                  = "azureuser"
  disable_password_authentication = true

  os_disk {
    name                 = "myOsDiskvmdocker"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }
  custom_data = filebase64("script/setup.sh")
}
*/
