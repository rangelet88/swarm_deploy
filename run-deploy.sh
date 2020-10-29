#!/bin/bash

## VARIABLES
SHARE_PATH='/srv/docker'
IP1=$(getent hosts instance-1 | awk '{print $1}')
IP2=$(getent hosts instance-2 | awk '{print $1}')
IP3=$(getent hosts instance-3 | awk '{print $1}')
export IP1 IP2 IP3
export REMOTE_MOUNT=$SHARE_PATH'/data'

# Es mou a la carpeta compartida amb la resta de nodes
cd $SHARE_PATH
# Clona el repositori
git clone https://github.com/rangelet88/swarm_deploy

# Crea les xarxes necessaries per al desplegament
docker network create --driver overlay proxy
docker network create --driver overlay portainer_agent

# Executa el desplegament dels serveis
cd $SHARE_PATH'/swarm_deploy'
docker stack deploy -c traefik/stack.yaml traefik
docker stack deploy -c portainer/stack.yaml portainer
docker stack deploy -c wordpress/stack.yaml wordpress
