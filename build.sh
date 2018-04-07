#!/bin/bash

docker-compose \
 -f ./docker/docker-compose.yml \
 -f ./docker/docker-compose.build.yml \
 build

date=`date +%Y%m%d`
docker image tag flexlab/my-fake-blog:ghost "flexlab/my-fake-blog:ghost-${date}"
docker image tag flexlab/my-fake-blog:nginx "flexlab/my-fake-blog:nginx-${date}"

docker image push "flexlab/my-fake-blog:ghost-${date}"
docker image push "flexlab/my-fake-blog:nginx-${date}"
