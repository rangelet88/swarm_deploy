#!/bin/bash
#
# Script d'inicialització del servei logspout-ELK
#

# Crea les carpetes necessaries per a la persistència del servei
mkdir -p ${REMOTE_MOUNT}/elasticsearch/data 2>/dev/null
mkdir -p  ${REMOTE_MOUNT}/logstash/config 2>/dev/null

#	Atorga permisos
chmod 1777 ${REMOTE_MOUNT}/elasticsearch/data

# Copia l'axiu de configuració de logstash
cp $SHARE_PATH/swarm_deploy/logspout-elk/files/logstash.conf ${REMOTE_MOUNT}/logstash/config/
