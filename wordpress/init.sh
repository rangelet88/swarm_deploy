#!/bin/bash
#
# Script d'inicialització del servei Wordpress
#

# Crea les carpetes necessaries per a la persistència del servei
mkdir -p ${REMOTE_MOUNT}/wordpress/data 2>/dev/null
