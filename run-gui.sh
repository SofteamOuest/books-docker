#!/bin/bash

docker rm books-gui -f

cd ../books-gui

docker build . -t registry.k8.wildwidewest.xyz/repository/docker-repository/books/gui

docker run -d --name books-gui \
    --network=book-net \
    -p 80:80 \
    -v $PWD/../books-gui:/usr/share/nginx/html \
    registry.k8.wildwidewest.xyz/repository/docker-repository/books/gui