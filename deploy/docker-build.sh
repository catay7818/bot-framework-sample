#!/usr/bin/env sh

acr_name="cataybotacr"
build_platform="linux/amd64"

bot_name="bot"
bot_tag="latest"
bot_image="${acr_name}.azurecr.io/${bot_name}:${bot_tag}"
bot_context="../02.echo-bot"
bot_dockerfile="./bot/Dockerfile"

docker build --tag $bot_image --file $bot_dockerfile $bot_context --platform $build_platform
docker push $bot_image

python_name="python"
python_tag="latest"
python_image="${acr_name}.azurecr.io/${python_name}:${python_tag}"
python_context="../python-api"
python_dockerfile="./python/Dockerfile"

docker build --tag $python_image --file $python_dockerfile $python_context --platform $build_platform
docker push $python_image
