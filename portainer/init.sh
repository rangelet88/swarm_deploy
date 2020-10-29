#!/bin/bash
#
# Script d'inicialització del servei Portainer
#

# Crea les carpetes necessaries per a la persistència del servei
mkdir -p ${REMOTE_MOUNT}/portainer/data 2>/dev/null

# Crea la xarxa necessària per al servei
docker network create --driver overlay portainer_agent
