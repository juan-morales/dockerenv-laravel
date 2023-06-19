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

#agregar usuario a docker
#comandos artisan
#comandos de estado de servicios
#comandos BD
#comandos laravel
#comandos para ejecutar tests
#comandos para hacer deploy y poner en vivo
#reiniciar servicios