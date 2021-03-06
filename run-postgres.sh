#!/bin/bash -x

docker rm books-postgres -f

cd ../books-postgres

docker build . -t registry.k8.wildwidewest.xyz/repository/docker-repository/books/postgres

docker run -d --name books-postgres \
    --network=book-net \
    -p 5432:5432 \
    registry.k8.wildwidewest.xyz/repository/docker-repository/books/postgres