docker stop $(docker ps -q); docker rm -v $(docker ps -qa); docker system prune --force
rm -v /opt/contianers/traefik/data/acme.json
touch /opt/containers/traefik/data/acme.json
chmod 600 /opt/containers/traefik/data/acme.json
docker network create proxy
cd /opt/containers/traefik
docker-compose up -d; docker-compose logs

