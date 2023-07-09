resource "azurerm_kubernetes_cluster" "rg_cp2_aks_mvg" {
    name = "rg_cp2_aks_mvg"
    resource_group_name = azurerm_resource_group.rg_cp2.name
    location = azurerm_resource_group.rg_cp2.location
    dns_prefix = "rgcp2aksmvg"

    default_node_pool {
      name = "default"
      node_count = 1
      vm_size = "Standard_D2_v2"
    }

    network_profile {
      network_plugin = "kubenet"
      load_balancer_sku = "standard"
    }

    tags = {
        environment = "tst"
    }

    linux_profile {
      admin_username = "azureuser"
        ssh_key {
            key_data = file("~/.ssh/id_rsa.pub")
        }
    }

    identity {
      type = "SystemAssigned"
    }
/*
    service_principal {
        client_id     = var.aks_service_principal_app_id
        client_secret = var.aks_service_principal_client_secret
    }
*/
}