#!/bin/bash

docker rm books-api -f

cd ../books-api

docker build . -t registry.k8.wildwidewest.xyz/repository/docker-repository/books/api

docker run -d --name books-api \
    --network=book-net \
    --env spring.datasource.url=jdbc:postgresql://books-postgres:5432/apibook \
    -p 8080:8080 \
    registry.k8.wildwidewest.xyz/repository/docker-repository/books/api