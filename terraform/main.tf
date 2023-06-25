
#Llamamos al provider
terraform {
  required_providers {
    azurerm         = {
      source        = "hashicorp/azurerm"
      version       = "~>2.0"
    }
    ssh = {
      source = "loafoe/ssh"
    }
  
  }
}
#Configuramos el id para conectar a la cuenta de azure
provider "azurerm" {
  features {}

  subscription_id   = "82790191-9b8b-41e9-916c-4ccd2b8530f5"
  #tenant_id         = "<azure_subscription_tenant_id>"
  #client_id         = "<service_principal_appid>"
  #client_secret     = "<service_principal_password>"
}

# Creamos las key SSH 
resource "tls_private_key" "rg_cp2_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
  }

#Creamos el resource_group bajo el cual construimos todos los objetos de Azure.
