#!/bin/bash

## VARIABLES
MASTER_HOSTNAME='swarm1'       ####  ALERTA! Substituïr pel hostname adequat!
SHARE_PATH='/srv/nfs'           # Path de la carpeta compartida
CLUSTER_PATH='/srv/docker'      # Path de la carpeta del clúster

# Instal·la els paquets de docker
apt install -y git bash-completion
curl https://get.docker.com | sudo bash

# Crea els directoris necessaris per al clúster
mkdir -p $CLUSTER_PATH

##	Configura NFS
# Configura la unitat de muntatge
echo $MASTER_HOSTNAME':'$SHARE_PATH' '$CLUSTER_PATH' nfs defaults,nfsvers=3 0 0' >> /etc/fstab
# Instal·la el client NFS
apt install -y nfs-common
# Fa el muntatge de la unitat
mount -a

## Creació del clùster
# Executa l'script per a unir-se al swarm
$CLUSTER_PATH'/join.sh'
