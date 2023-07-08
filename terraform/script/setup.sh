#!/bin/bash
#updating repositorios
#instalamos el servicio de podman lo seteamos para que se ejecute 
#el servicio al inicio del sistema y lo arrancamos.
apt update && apt install -y podman git  
systemctl enable podman 
systemctl start podman

# descargamos el repositorio para tener el código de los dockerfiles a desplegar como proyecto
git clone https://github.com/mvazgon/vscodeserver.git

#Construimos la imagen 
cd vscoderserver
podman build -t vscodeserver:latest . 