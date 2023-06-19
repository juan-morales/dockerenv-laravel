#!/bin/bash

# Script para instalar Docker y Docker-compose en Ubuntu
# Autor: Juan Carlos Morales <jcmargentina@gmail.com>

# Actualizamos los repositorios de software del sistema operativo
sudo apt update

# Instalamos requerimientos de docker y docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install docker-ce

# Verificamos que el servicio este corriendo
sudo systemctl status docker

# Agregamos al usuario actual (quien ejecuta el script) al grupo de usuarios docker
sudo usermod -aG docker ${USER}

# Bajamos e instalamos docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.18.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

echo "Fin de la instalacion"