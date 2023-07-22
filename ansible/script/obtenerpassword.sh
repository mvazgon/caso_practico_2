#!/bin/bash
podman exec -ti vscodeinstance cat /home/user01/.config/code-server/config.yaml|awk '/^password/ {print $2}'
