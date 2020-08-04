#!/bin/bash

REGISTRY=$1
ORG=$2
TAG=`git describe --tags | awk -F '-' '{print $1}'`

cat docker/mondrian/dockerfile_template \
 | sed "s/{git_commit}/$TAG/g" \
 > docker/mondrian/dockerfile

docker build -t $REGISTRY/$ORG/mondrian:$TAG -f docker/mondrian/dockerfile . --no-cache

docker push $REGISTRY/$ORG/mondrian:$TAG
