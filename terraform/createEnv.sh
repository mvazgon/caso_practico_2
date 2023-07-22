#!/bin/bash

# Refrescamos la información de Terraform
terraform refresh
#Extraemos la información de la pulic IP y la dejamos en el archivo correspondiente
. createAzureK8s.sh
export K8S=$(grep server ~/.kube/config|cut -d: -f2,3)
cp -rp ../ansible/azureinfra.cfg ../ansible/azureinfra.cfg.$$
export PUBLICIP=$(terraform output -raw public_ip_address)
cat <<EOF > ../ansible/azureinfra.cfg
[all]
[docker]
$PUBLICIP ansible_user=azureuser
[k8s]
$K8S
EOF

export ACRUSER=$(terraform output -raw rg_cp2_acr_adminUsername)
export ACRPASS=$(terraform output -raw rg_cp2_acr_adminUserpassword)
export ACRSERVER=$(terraform output -raw rg_cp2_acr_login_server)
