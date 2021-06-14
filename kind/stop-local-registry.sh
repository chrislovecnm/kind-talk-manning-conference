#!/bin/bash

running="$(docker inspect -f '{{.State.Running}}' "${reg_name}" 2>/dev/null || true)"
if [ "${running}" == 'true' ]; then
  ID=$(docker ps | grep registry | awk '{ print $1 }')
  docker kill ${ID}
  docker rm ${ID}
fi
