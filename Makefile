# Regular text
NC := \033[0m

# Regular colors
BLACK := \033[0;30m
RED := \033[0;31m
GREEN := \033[0;32m
YELLOW := \033[0;33m
BLUE := \033[0;34m
PURPLE := \033[0;35m
CYAN := \033[0;36m
WHITE := \033[0;37m

# Bold colors
BOLD_BLACK := \033[1;30m
BOLD_RED := \033[1;31m
BOLD_GREEN := \033[1;32m
BOLD_YELLOW := \033[1;33m
BOLD_BLUE := \033[1;34m
BOLD_PURPLE := \033[1;35m
BOLD_CYAN := \033[1;36m
BOLD_WHITE := \033[1;37m

# High-intensity colors
GRAY := \033[0;90m
BOLD_GRAY := \033[1;90m
HI_RED := \033[0;91m
HI_GREEN := \033[0;92m
HI_YELLOW := \033[0;93m
HI_BLUE := \033[0;94m
HI_PURPLE := \033[0;95m
HI_CYAN := \033[0;96m
HI_WHITE := \033[0;97m

# Bold high-intensity colors
BOLD_HI_BLACK := \033[1;90m
BOLD_HI_RED := \033[1;91m
BOLD_HI_GREEN := \033[1;92m
BOLD_HI_YELLOW := \033[1;93m
BOLD_HI_BLUE := \033[1;94m
BOLD_HI_PURPLE := \033[1;95m
BOLD_HI_CYAN := \033[1;96m
BOLD_HI_WHITE := \033[1;97m

ifeq ($(OS), Windows_NT)
	
else
	sudo := sudo
endif

build:
	@printf "${GRAY}>${NC}\n"
	@$(sudo) docker-compose build 2> debug.log;
	@if [ $$? -ne 0 ]; then \
		printf "${GRAY}Construyendo imagenes ... ${NC} ${BOLD_HI_RED}ERROR${NC}\n"; \
		exit 1; \
	else \
		printf "${GRAY}Construyendo imagenes ... ${NC} ${BOLD_HI_GREEN}OK${NC}\n"; \
	fi

build-nocache:
	@printf "${GRAY}>${NC}\n"
	@$(sudo) docker-compose build --no-cache 2> debug.log;
	@if [ $$? -ne 0 ]; then \
		printf "${GRAY}Construyendo imagenes ... ${NC} ${BOLD_HI_RED}ERROR${NC}\n"; \
		exit 1; \
	else \
		printf "${GRAY}Construyendo imagenes ... ${NC} ${BOLD_HI_GREEN}OK${NC}\n"; \
	fi

build-database:
	@printf "${GRAY}>${NC}\n"
	@$(sudo) docker-compose up --build --force-recreate --no-deps database 2> debug.log;
	@if [ $$? -ne 0 ]; then \
		printf "${GRAY}Construyendo servicio de base de datos ... ${NC}${BOLD_HI_RED}ERROR${NC}\n"; \
		exit 1; \
	else \
		printf "${GRAY}Construyendo servicio de base de datos ... ${NC}${BOLD_HI_GREEN}OK${NC}\n"; \
	fi

build-phpfpm:
	@printf "${GRAY}>${NC}\n"
	@$(sudo) docker-compose up --build --force-recreate --no-deps phpfpm 2> debug.log;
	@if [ $$? -ne 0 ]; then \
		printf "${GRAY}Construyendo servicio de aplicacion PHP ... ${NC}${BOLD_HI_RED}ERROR${NC}\n"; \
		exit 1; \
	else \
		printf "${GRAY}Construyendo servicio de aplicacion PHP ... ${NC}${BOLD_HI_GREEN}OK${NC}\n"; \
	fi

build-webserver:
	@printf "${GRAY}>${NC}\n"
	@$(sudo) docker-compose up --build --force-recreate --no-deps webserver 2> debug.log;
	@if [ $$? -ne 0 ]; then \
		printf "${GRAY}Construyendo servicio de servidor web NgInx ... ${NC}${BOLD_HI_RED}ERROR${NC}\n"; \
		exit 1; \
	else \
		printf "${GRAY}Construyendo servicio de servidor web NgInx ... ${NC}${BOLD_HI_GREEN}OK${NC}\n"; \
	fi

up-interactive:
	@printf "${GRAY}Iniciando en modo interactivo ... ${NC}\n"
	@$(sudo) docker-compose up;
	@if [ $$? -ne 0 ]; then \
		printf "${GRAY}Fin modo interactivo ... ${NC}${BOLD_HI_RED}ERROR${NC}\n"; \
		exit 1; \
	else \
		printf "${GRAY}Fin modo interactivo ... ${NC}${BOLD_HI_GREEN}OK${NC}\n"; \
	fi

up:
	@printf "${GRAY}Iniciando servicios ... ${NC}\n"
	@$(sudo) docker-compose up -d;
	@if [ $$? -ne 0 ]; then \
		printf ">>> ${BOLD_HI_RED}ERROR${NC}\n"; \
		exit 1; \
	else \
		printf ">>> ${BOLD_HI_GREEN}OK${NC}\n"; \
	fi

down:
	@printf "${GRAY}Deteniendo servicios ... ${NC}\n"
	@$(sudo) docker-compose down;
	@if [ $$? -ne 0 ]; then \
		printf ">>> ${BOLD_HI_RED}ERROR${NC}\n"; \
		exit 1; \
	else \
		printf ">>> ${BOLD_HI_GREEN}OK${NC}\n"; \
	fi

terminal-webserver:
	@printf "${GRAY}Abriendo terminal en servicio de servidor web ... ${NC}\n"
	@$(sudo) docker-compose exec webserver bash 2> debug.log;

terminal-database:
	@printf "${GRAY}Abriendo temrinal en servicio de base de datos ... ${NC}\n"
	@$(sudo) docker-compose exec database bash 2> debug.log;

terminal-laravel:
	@printf "${GRAY}Abriendo terminal en servicio de aplicacion ... ${NC}\n"
	@$(sudo) docker-compose exec phpfpm bash;
	@if [ $$? -ne 0 ]; then \
		printf ">>> ${BOLD_HI_RED}ERROR${NC}\n"; \
		exit 1; \
	else \
		printf ">>> ${BOLD_HI_GREEN}OK${NC}\n"; \
	fi

install-docker:
	@$(sudo) chmod +x ./install_docker.sh
	@$(sudo) ./install_docker.sh

add-current-user-to-docker:
	$(sudo) sudo usermod -aG docker ${USER}

install-laravel:
	$(sudo) docker-compose exec phpfpm composer install

#agregar usuario a docker
#comandos artisan
#comandos de estado de servicios
#comandos BD
#comandos laravel
#comandos para ejecutar tests
#comandos para hacer deploy y poner en vivo
#reiniciar servicios
