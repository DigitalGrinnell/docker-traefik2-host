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
docker network create proxy
cd /opt/containers/traefik
docker-compose up -d; docker-compose logs
cd ../watchtower
docker-compose up -d; docker-compose logs
cd ../portainer
docker-compose up -d; docker-compose logs
cd ../static-landing-page
docker-compose up -d; docker-compose logs
cd ../rootstalk-static
docker-compose up -d; docker-compose logs
cd ../vaf
docker-compose up -d; docker-compose logs
docker-compose --file docker-compose.kiosk.yml up -d; docker-compose logs
#
echo "Dumping traefik.log..."
docker exec -it traefik cat /var/log/traefik.log
