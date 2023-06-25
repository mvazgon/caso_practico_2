#Conjunto de nombres que vamos a ir definiendo en este archivo. 
# tienen una estructura de tipo key value:

variable "name_rg" {
    type = string
    description = "Contiene el valor del resource group"
    nullable = false
    default = "rg_cp2"
#    validation {
#        condition = length(regexall("^[a-zA-Z][a-zA-Z0-9_-]{5,20}$",var.reg_cp2)) == 1
#        error_message = "Este nombre no puede ser nulo"      
#   }
}

variable "location" {
    type = string
    description = "zona donde desplegaremos el rg"
    nullable = false
    default = "spaincentral"
}

variable "prefix" {
    type = string
    description = "Prefijo para las cadenas de este deploy"
    nullable = false
    default = "cp2"
}
