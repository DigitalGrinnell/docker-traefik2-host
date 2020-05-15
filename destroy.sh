#!/bin/bash
#
docker stop $(docker ps -q);
docker rm -v $(docker ps -qa);
# docker image rm $(docker image ls -q)
docker system prune --force
#
rm -v /opt/contianers/traefik/data/acme.json
touch /opt/containers/traefik/data/acme.json
chmod 600 /opt/containers/traefik/data/acme.json
