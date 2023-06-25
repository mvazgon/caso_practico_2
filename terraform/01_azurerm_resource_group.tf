
#Resource group donde se despliega la infraestructura.data 

resource "azurerm_resource_group" "rg_cp2" {
  name              = var.name_rg
  location          = var.location
}