
output "rg_id" {
  value                 = azurerm_resource_group.rg_cp2.id
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

output "domain_name_label" {
  value                 = azurerm_public_ip.rg_cp2_public_ip_vmdocker.fqdn
}

output "public_ip_address" {
  value                 = azurerm_public_ip.rg_cp2_public_ip_vmdocker.ip_address
}

output "rg_cp2_acr_adminUsername" {
    value               = azurerm_container_registry.rgcp2acrmvg.admin_username
    sensitive           = true
}

output "rg_cp2_acr_adminUserpassword" {
    value               = azurerm_container_registry.rgcp2acrmvg.admin_password
    sensitive           = true
}

output "rg_cp2_acr_login_server" {
  value                 = azurerm_container_registry.rgcp2acrmvg.login_server
}

output "rg_cp2_aks_mvg_kube_config" {
  value                 = azurerm_kubernetes_cluster.rg_cp2_aks_mvg.kube_config_raw
  sensitive = true
}

output "client_certificate" {
    value     = azurerm_kubernetes_cluster.rg_cp2_aks_mvg.kube_config[0].client_certificate
    sensitive = true
}

output "client_key" {
    value     = azurerm_kubernetes_cluster.rg_cp2_aks_mvg.kube_config[0].client_key
    sensitive = true
}

output "cluster_ca_certificate" {
    value     = azurerm_kubernetes_cluster.rg_cp2_aks_mvg.kube_config[0].cluster_ca_certificate
    sensitive = true
}

output "cluster_password" {
    value     = azurerm_kubernetes_cluster.rg_cp2_aks_mvg.kube_config[0].password
    sensitive = true
}

output "cluster_username" {
    value     = azurerm_kubernetes_cluster.rg_cp2_aks_mvg.kube_config[0].username
    sensitive = true
}

output "host" {
    value     = azurerm_kubernetes_cluster.rg_cp2_aks_mvg.kube_config[0].host
    sensitive = true
}

/*
output "rg_cp2_aks_mvg_client_certificate" {
  value                 = azurerm_kubernetes_cluster.rg_cp2_aks_mvg.kube_config.0.rg_cp2_aks_client_certificate
}
*/