# Create virtuals machines
#Definimos la VM que va a tener los playbooks de vmdocker01
resource "azurerm_linux_virtual_machine" "rg_cp2_vmdocker" {
  name                            = "rg_cp2_vmdocker"
  location                        = var.location
  resource_group_name             = var.name_rg
  network_interface_ids           = [azurerm_network_interface.rg_cp2_nic_vmdocker.id]
  size                            = "Standard_DS1_v2"
  computer_name                   = "vmdocker01"
  admin_username                  = "azureuser"
  disable_password_authentication = true

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
 
  admin_ssh_key {
    username   = "azureuser"
    public_key = tls_private_key.rg_cp2_ssh_key.public_key_openssh
  }
}

#Definición de la MV vmansible01
resource "azurerm_linux_virtual_machine" "rg_cp2_vmansibel"{
  name                            = "rg_cp2_vmansible"
  location                        = var.location
  resource_group_name             = var.name_rg
  network_interface_ids           = [azurerm_network_interface.rg_cp2_nic_vmansible.id]
  size                            = "Standard_DS1_v2"
  computer_name                   = "vmansible01"
  admin_username                  = "azureuser"
  disable_password_authentication = true

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  admin_ssh_key {
    username   = "azureuser"
    public_key = tls_private_key.rg_cp2_ssh_key.public_key_openssh
  }
}