#!/bin/bash

docker rm books-gui

cd ../books-gui

docker build . -t registry.k8.wildwidewest.xyz/repository/docker-repository/books/gui

docker run -d --name books-gui --link books-api:books-api -p 80:80 registry.k8.wildwidewest.xyz/repository/docker-repository/books/gui