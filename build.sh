#!/bin/bash
cd $(dirname "$0")

echo '===================
install node16 or use nvm and swith to node16
> curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
follow the instruction.

> nvm install 16
> nvm use 16

install yarn package manager
> sudo npm install -g yarn
===================
'

yarn install --frozen-lockfile

# tsc outputs type definitions to dist-types/ in the repo root, which are then consumed by the build
yarn tsc

# Build the backend, which bundles it all up into the packages/backend/dist folder.
# The configuration files here should match the one you use inside the Dockerfile below.
yarn build:backend --config $(pwd)/app-config.yaml

echo '===================
build and run docker with
> docker-compose build
> cp .env-example .env
modify env file if required
> docker-compose up -d
> docker-compose ps
> docker-compose logs --tail 100
'

# build docker image
#docker-compose build

# crete .env file 
# cp .env-example .env

# run docker-compose
#docker-compose up -d
