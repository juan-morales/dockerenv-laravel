#!/bin/bash

# Script para instalar Docker y Docker-compose en Ubuntu
# Autor: Juan Carlos Morales <jcmargentina@gmail.com>

# Actualizamos los repositorios de software del sistema operativo
echo -en "Actualizando repositorio de paquetes";
sudo apt update > /dev/null 2>&1;
echo -e "\u2714";

# Instalamos requerimientos de docker y docker
echo -en "Instalando docker";
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common > /dev/null 2>&1;
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -  > /dev/null 2>&1;
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" > /dev/null 2>&1;
apt-cache policy docker-ce > /dev/null 2>&1;
sudo apt install -y docker-ce > /dev/null 2>&1;
echo -e "\u2714";

# Agregamos al usuario actual (quien ejecuta el script) al grupo de usuarios docker
echo -en "Agregando usuario actual al grupo unix de docker";
sudo usermod -aG docker ${USER} > /dev/null 2>&1;
echo -e "\u2714";

# Bajamos e instalamos docker-compose
echo -en "Instalando docker-compose";
sudo curl -L "https://github.com/docker/compose/releases/download/v2.18.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose > /dev/null 2>&1;
sudo chmod +x /usr/local/bin/docker-compose > /dev/null 2>&1;
docker-compose --version  > /dev/null 2>&1;
echo -e "\u2714";

echo -e "Fin de la instalacion \u2691"