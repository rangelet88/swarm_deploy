#!/bin/bash

## VARIABLES
SHARE_PATH='/srv/docker'
IP1=$(getent hosts swarm1 | awk '{print $1}')
IP2=$(getent hosts swarm2 | awk '{print $1}')
IP3=$(getent hosts swarm3 | awk '{print $1}')
PUBLIC_IP=$(curl ifconfig.co)
export IP1 IP2 IP3
export REMOTE_MOUNT=$SHARE_PATH'/data'
export PUBLIC_IP=$PUBLIC_IP

# Es mou a la carpeta compartida amb la resta de nodes
cd $SHARE_PATH
# Clona el repositori
git clone https://github.com/rangelet88/swarm_deploy

# Crea les xarxes necessaries per al desplegament
docker network create --driver overlay proxy

# Es mou a la carpeta del repositori
cd $SHARE_PATH/swarm_deploy/

# Atorga permisos i executa els scripts d'inicialització
chmod +x portainer/init.sh
portainer/init.sh
chmod +x wordpress/init.sh
wordpress/init.sh
chmod +x logspout-elk/init.sh
logspout-elk/init.sh

# Desplegament del serveis
docker stack deploy -c traefik/stack.yaml traefik
docker stack deploy -c portainer/stack.yaml portainer
docker stack deploy -c wordpress/stack.yaml wordpress
docker stack deploy -c logspout-elk/stack.yaml logspout
