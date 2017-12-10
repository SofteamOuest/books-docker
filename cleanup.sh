#!/bin/bash

docker rm books-postgres books-api books-gui -f

docker network rm book-net