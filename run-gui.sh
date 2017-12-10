#!/bin/bash

docker rm books-gui -f

cd ../books-gui

docker build . -t registry.k8.wildwidewest.xyz/repository/docker-repository/books/gui

export books_gui_dir=//c/Users/softeam2/dev/books-gui

docker run -d --name books-gui \
    --network=book-net \
    -p 80:80 \
    --env books_api_url=books-api \
    -v $books_gui_dir:/usr/share/nginx/html \
    registry.k8.wildwidewest.xyz/repository/docker-repository/books/gui