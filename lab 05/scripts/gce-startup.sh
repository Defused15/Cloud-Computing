#!/bin/bash
# Script de inicio: arranca el contenedor de Docker Hub en el puerto 80
docker rm -f web-estatica-basica 2>/dev/null
docker run -d --name web-estatica-basica --restart always -p 80:80 defused/web-estatica-basica:v0
