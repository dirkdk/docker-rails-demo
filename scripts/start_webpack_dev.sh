#!/bin/bash

echo "starting webpack dev" && export NODE_OPTIONS="--max_old_space_size=4096 --openssl-legacy-provider" && yarn && rm -rf /opt/dockerrailsdemo/public/packs && bin/webpack-dev-server
