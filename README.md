# Entorno Docker SNOWSTORM MANAGER

El presente entorno fue desarrollado para ejecutar la aplicacion en laravel **Snowstorm Manager.**

### Servicios disponibles
- Laravel: 10
- MariaDB: 10.6
- Nginx: 1.24.0
- PHP-fpm: 8.1.19
- PHPMyAdmin: latest

## Instalacion

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