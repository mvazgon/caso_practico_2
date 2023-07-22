#!/bin/bash

POD=$(podman  ps -a --format "{{.Names}}")

if [ "$POD" != "vscodeinstance" ]
then 
	podman run -d -p 443:8080 --name vscodeinstance vscodeserver:latest
fi
