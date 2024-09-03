### Instalación de Postgres y MariaDB

Luego de instalar podman, agregar la siguiente linea al archivo: /etc/containers/registries.conf
unqualified-search-registries = ["docker.io"]


#### Configuraciones para Postgres

podman pod create --name postgres-pod -p 9876:80

podman run --name pgadmin --pod=postgres-pod -e 'PGADMIN_DEFAULT_EMAIL=email@gmail.com' -e 'PGADMIN_DEFAULT_PASSWORD=12345678' -d -p dpage/pgadmin4

podman run --pod=postgres-pod -v ~/podman/postgres/data:/var/lib/postgresql/data:Z -e POSTGRES_PASSWORD=12345678
