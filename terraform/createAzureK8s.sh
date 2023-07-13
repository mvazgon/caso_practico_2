#!/bin/bash
echo "$(terraform output rg_cp2_aks_mvg_kube_config)" > ~/.kube/config
sed -i 's/EOT//' ~/.kube/config
sed -i 's/<<//' ~/.kube/config
