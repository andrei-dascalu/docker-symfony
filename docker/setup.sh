#!/bin/bash -e

[ -z "${SYMFONY_FOLDER}" ] && echo "No var set" && exit 1

echo "Using ${SYMFONY_FOLDER} as project folder"

[ ! -d "/app/${SYMFONY_FOLDER}" ] && cd /app && symfony new ${SYMFONY_FOLDER} --full --no-git

cd /app/${SYMFONY_FOLDER} && symfony server:start --no-tls --port=80 --allow-http
