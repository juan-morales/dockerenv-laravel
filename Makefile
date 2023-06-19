ifeq ($(OS), Windows_NT)
	
else
	sudo := sudo
endif

build:
	$(sudo) docker-compose build

up-interactive:
	$(sudo) docker-compose up

up:
	$(sudo) docker-compose up -d

down:
	$(sudo) docker-compose down

terminal-webserver:
	$(sudo) docker-compose exec webserver bash

terminal-database:
	$(sudo) docker-compose exec database bash

terminal-laravel:
	$(sudo) docker-compose exec phpfpm bash

install-docker:
	@$(sudo) chmod +x ./install_docker.sh
	@$(sudo) ./install_docker.sh

add-current-user-to-docker:
	$(sudo) sudo usermod -aG docker ${USER}

#agregar usuario a docker
#comandos artisan
#comandos de estado de servicios
#comandos BD
#comandos laravel
#comandos para ejecutar tests
#comandos para hacer deploy y poner en vivo
#reiniciar servicios