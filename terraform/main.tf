terraform {
  required_providers {
    azurerm         = {
      source        = "hashicorp/azurerm"
      version       = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id   = "82790191-9b8b-41e9-916c-4ccd2b8530f5"
  #tenant_id         = "<azure_subscription_tenant_id>"
  #client_id         = "<service_principal_appid>"
  #client_secret     = "<service_principal_password>"
}

# Your code goes here

resource "azurerm_resource_group" "rg_cp2" {
  name              = var.name_rg
  location          = var.location
}

resource "azurerm_virtual_network" "rg_cp2_network" {
  name = "rg_cp2_network"
  resource_group_name = var.name_rg
  location            = var.location
  address_space       = ["192.168.254.0/24"]
}

# Creamos un network sec grou
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
