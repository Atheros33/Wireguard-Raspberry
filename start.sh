#!/bin/sh

docker-compose pull wireguard
docker-compose build && docker-compose up -d
