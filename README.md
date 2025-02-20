# mydotnetapi

Rename .env.example to .env and determine the environment

# Levantar la app sin docker-compose

## Reconstruir la imagen
docker build -t nombre-de-tu-imagen .

## Ejecutar el contenedor
docker run --name nombre-contenedor -p 8080:8080 -d nombre-de-tu-imagen

# Levantar la app con docker-compose
docker compose -p nombre-contenedor up --build -d

## Eliminar el contenedor
docker compose -p nombre-contenedor down

## Eliminar el contenedor y los volumenes
docker compose -p nombre-contenedor down -v

## Para ver que la variable se cargó correctamente
docker exec -it <nombre_del_contenedor> printenv MY_ENV_VAR