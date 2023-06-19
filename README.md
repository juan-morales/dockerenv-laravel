# Entorno Docker SNOWSTORM MANAGER

El presente entorno fue desarrollado para ejecutar la aplicacion en laravel **Snowstorm Manager.**.

### Servicios disponibles
- Laravel: 10
- MariaDB: 10.6
- Nginx: 1.24.0
- PHP-fpm: 8.1.19
- PHPMyAdmin: latest

### Accesos desde maquina host
- Laravel: http://localhost
- PHPMyAdmin: http://localhost:8080
- MariaDB: Puerto 3306, la base de datos se llama "snowstorm_manager"

## Requerimientos

### Linux

1. Instalar Git
2. Ejecutar en un terminal
```bash
make install-docker
```

### Windows

1. Instalar docker Desktop
    - esta instalacion ya tiene docker-compose
2. Instalar Git
    - El instalador ofrecera instalar una terminal BASH, por favor instalar el terminal.
3. Instalar Make
    - Es necesario hacerlo madiante el gestor de paquetes __chocolatey__

## Instalacion del proyecto
1. Clonar el repositorio
2. Ejecutar en un terminal dentro de el directorio del proyecto
```bash
make build
```
3. Ejecutar el entorno en modo interactivo, para ver que todos los servicios se ejecuten sin errores
```bash
make up-interactive
```
4. Bajar en entorno
```bash
make down
```
5. Volver a levantar el entorno en segundo plano
```bash
make up
```

## Comandos MAKE

Los comandos make se ejecutan desde un terminal de la siguiente forma:
```bash
make <comando>
```

### Lista de comandos y descripcion

**build**: Construye todo el entorno.

**up-interactive**: Ejecuta el entorno en modo interactivo.

**up**: Ejecuta el entorno en segundo plano.

**down**: Para la ejecucion de todo el entorno.

**terminal-webserver**: Abre un terminal BASH en el servicio Nginx.

**terminal-database**: Abre un terminal BASH en el servicio MariaDB.

**terminal-laravel**: Abre un terminal BASH en el servicio de la aplicacion de Laravel.

**install-docker**: Ejecuta el script __install_docker.sh__ de este proyecto. Instala docker y docker-compose en entornos unix.

**add-current-user-to-docker**: Agrega al usuario unix actual, al grupo de usuarios docker.