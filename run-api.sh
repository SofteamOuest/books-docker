#!/bin/bash

docker rm books-api

cd ../books-api

docker build . -t registry.k8.wildwidewest.xyz/repository/docker-repository/books/api

docker run -d --name books-api \
    --link books-postgres:books-postgres \
    --env spring.datasource.url=jdbc:postgresql://books-postgres:5432/apibook \
    registry.k8.wildwidewest.xyz/repository/docker-repository/books/api