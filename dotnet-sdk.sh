#!/bin/bash

set -eux

cd $(dirname $0)

BASE_DOCKER_CMD="docker run -it --rm --volume $(pwd)/src:/opt -p 5000:5000 mcr.microsoft.com/dotnet/core/sdk"

new() {
  $BASE_DOCKER_CMD dotnet new blazorserver -o /opt/BadasstronautSolutions --force
  sudo chown --recursive $USER:$USER src/**
}

run() {
  $BASE_DOCKER_CMD dotnet watch --project /opt/BadasstronautSolutions run --urls http://0.0.0.0:5000
}

# new
run
