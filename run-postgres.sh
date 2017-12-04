#!/bin/bash

docker rm books-postgres -f

cd ../books-postgres

docker build . -t registry.k8.wildwidewest.xyz/repository/docker-repository/books/postgres

docker run -d --name books-postgres \
    -v /home/elkouhen/dev/meltingpoc/books-docker/data:/var/lib/postgresql/data \
    -p 5432:5432 \
    registry.k8.wildwidewest.xyz/repository/docker-repository/books/postgres