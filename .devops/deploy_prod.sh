#!/bin/sh
docker-compose -f /drone/src/docker-compose.prod.yml config >/drone/src/docker-compose.processed.yml
docker stack deploy -c /drone/src/docker-compose.processed.yml ror-hello-world
