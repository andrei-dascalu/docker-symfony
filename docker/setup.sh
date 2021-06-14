#!/bin/bash -e

export PROJECT_FOLDER=symproject

[ ! -d "/app/${PROJECT_FOLDER}" ] && cd /app && symfony new ${PROJECT_FOLDER} --full --no-git

cd /app/${PROJECT_FOLDER} && symfony server:start --no-tls --port=80 --allow-http
