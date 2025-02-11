#!/usr/bin/env sh

cd ../02.echo-bot
docker build --tag cataybotacr.azurecr.io/bot:latest .
docker build --tag cataybotacr.azurecr.io/bot:latest-amd64 . --platform linux/amd64
docker push cataybotacr.azurecr.io/bot:latest-amd64

cd ../python-api
docker build --tag cataybotacr.azurecr.io/python:latest .
docker build --tag cataybotacr.azurecr.io/python:latest-amd64 . --platform linux/amd64
docker push cataybotacr.azurecr.io/python:latest-amd64
