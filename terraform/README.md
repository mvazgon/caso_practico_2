# Informe de creación de la infraestructura con Terraform (Caso Práctico 2)
## Definición del Caso práctico
El caso práctico se divide en tres apartados fundamentales:
- creación de una infraestructura en Azure con los siguientes componentes
 - crear un azure container registry y recuperar las credenciales para conectar a partir de la información de outpus de terraform.
   - crear una imagen de una aplicación a partir de un dockerfile
   - subir dicha imagen a un azure container registry (acr)
 - una máquina virtual en la que aplicaremos los playbooks de ansible para:
   - instalar podman
   - desplegar desde el ACR la imagen creada anteriormente. 
 - crear un cluster de K8s con el recurso Azure Kubernetes Cluster y recuperar la información para conectar, configurandolo en la máquina local
   - desplegar con ansible un deploy de una imagen de una app con persistencia local.
## Definición y creación de elementos comunes.
A toda la infraestructura será común:
- un par de claves privada y pública para crear todos los servicios
- un recurso azurerm_resource_group , que nos permitirá aglutinar todos los elementos en un solo recurso general para su gestión lógica
## Creación de la máquina virtual
Para ello tiraremos de los siguientes recursos:
- azurerm_network
- azurerm_subnet,depende del anterior y del resource_group
- azurerm_public_ip, depende de los anteriores
- azurerm_network_interface, depende de los anteriores
- azurerm_linux_virtual_machine, la máquina propiamente dicha y depende de todos los anteriores componentes.
Tenemos que recuperar del mismo los siguientes elementos:
- la dirección IP pública
## Creación del Azure Container Registry
Para este recurso solo depende del resource_group desplegado anteriormente.

## Creación del Cluster de Kubernetes en Azure (AKS)
Para ello tenemos que usar el resource: *azurerm_kubernetes_cluster*; que está relacionado con el recurso: *resource_group*; definido para anteriores objetos. Dentro de este objeto tenemos que definir las siguientes propiedades:
- dns_prefix = "rgcp2aksmvg"
- default_node_pool, donde definimos los elementos del pool
    - name , que definimos: "default"
    - node_count , definimos a 1 para nuestro ejemplo
    - vm_size , que definimos a:  "Standard_D2_v2"
- network_profile, donde definimos las caracteristicas de red:
    - network_plugin = "kubenet"
    - load_balancer_sku = "standard"
- linux_profile, que nos permitirá definir las credenciales en el cluster:
    - admin_username, que definimos con el nombre de: "azureuser"
    - ssh_key, dentro de este usamos la key pública que estamos definiendo en otros recursos: key_data = file("~/.ssh/id_rsa.pub")
- type = "SystemAssigned"
- recuperación de las credenciales de conexión al cluster, ejecutamos el comando:
    > $echo "$(terraform output rg_cp2_aks_mvg_kube_config)" > ./azurek8s
- comprobamos la conexión con el comando:
    > $ kubectl get pods 