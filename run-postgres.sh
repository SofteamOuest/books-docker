#!/bin/bash

docker rm books-postgres

cd ../books-postgres

docker build . -t registry.k8.wildwidewest.xyz/repository/docker-repository/books/postgres

docker run -d --name books-postgres \
    registry.k8.wildwidewest.xyz/repository/docker-repository/books/postgres