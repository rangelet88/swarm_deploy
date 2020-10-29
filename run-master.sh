#!/bin/bash

## VARIABLES
MASTER_HOSTNAME='swarm1'       ####  ALERTA! Substituïr pel hostname adequat!
SHARE_PATH='/srv/nfs'           # Path de la carpeta compartida
CLUSTER_PATH='/srv/docker'      # Path de la carpeta del clúster
# Detecta la IP de la màquina
BASERANGE=$(ip -4 a show dev ens4  | awk '/inet/ {print $2}' | cut -d\. -f1-3)

# Instal·la els paquets de docker
apt install -y git bash-completion
curl https://get.docker.com | sudo bash

# Crea els directoris necessaris per al clúster
mkdir -p $SHARE_PATH
mkdir -p $CLUSTER_PATH'/data'

# Instal·la els paquets necessaris del servidors NFS
apt install -y nfs-kernel-server

##	Configura NFS
# Configura a si mateix la unitat de muntatge
echo $MASTER_HOSTNAME':'$SHARE_PATH' '$CLUSTER_PATH' nfs defaults,nfsvers=3 0 0' >> /etc/fstab
# Configura la unitat per compartir-la amb la resta de nodes
echo $SHARE_PATH' '$BASERANGE'.0/24(rw,no_root_squash,no_subtree_check)' >> /etc/exports
# Reinicia el servei NFS
systemctl start nfs-kernel-server
# Fa l'export i el muntatge
exportfs -r
mount -a

# Incrementem la memoria del node
echo 'vm.max_map_count=262144' >> /etc/sysctl.conf

## Creació del clùster
cd $CLUSTER_PATH
# Inicialitza com a clùster swarm
docker swarm init
# Desa el token en un arxiu per a que pugui ser utilitzat per a unir els altres nodes
docker swarm join-token manager | grep join  > join.sh
chmod +x join.sh
