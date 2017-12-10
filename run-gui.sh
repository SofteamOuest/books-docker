#!/bin/bash

docker rm books-gui -f

cd ../books-gui

docker build . -t registry.k8.wildwidewest.xyz/repository/docker-repository/books/gui

export BOOK_GUI_PATH=//c/Users/softeam2/dev/books-gui

docker run -d --name books-gui \
    --network=book-net \
    -p 80:80 \
    --env books_api_url=books-api \
    -v $BOOK_GUI_PATH:/usr/share/nginx/html \
    registry.k8.wildwidewest.xyz/repository/docker-repository/books/gui