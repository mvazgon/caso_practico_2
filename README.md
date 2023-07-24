# caso_practico_2
Repositorio para el caso practico numero 2
En este repositorio está contenido todo el código del caso práctico, incluido scripts y playbook para personalizar el entorno desdel el cual se ejecuta el código de terraform, ansible y kuberntes. 
Se distribuye en tres directorios, uno por cada tecnología, que son:
- terraform, contiene el código y scripts para extraer y dejar accesible la infraestructura de Azure. Con este código desplegamos en azure, los siguientes objetos: una máquina virtual, un azure container registry, un cluster de kubernetes.
- ansible, contiene los playbooks que se usan para desplegar la aplicación "vscode" en un contenedor con la herramienta Podman.
- k8s, contiene todo el código de kubernetes que nos permite desplegar la aplicación "mailhog" en un deploy en la infraestructura de AKS que se crea con el código de terraform. 
