#!/bin/bash
source .env
export DOCKER_USERNAME=$(grep ^DOCKER_USERNAME= .env | cut -d= -f2)
export DOCKER_PASSWORD=$(grep ^DOCKER_PASSWORD= .env | cut -d= -f2)
#
### SUBINDO DOCKER

echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
docker pull junioroliveira/listadostour:latest
docker compose stop
docker compose up -d
docker exec php_prod_360 locale-gen
docker compose stop
docker compose up -d
