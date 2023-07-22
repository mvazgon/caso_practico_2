#!/bin/bash
#descargamos la llave
curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor |tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null

#Creamos el repositorio
AZ_REPO=$(lsb_release -cs); echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list

AZ=$(which az)

if [ "$AZ" == "" ]
then
	apt update && apt install -y azure-cli
fi
