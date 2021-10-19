# swarm_deploy

Desplegament automatitzat d'una infraestructura Docker Swarm amb els següents serveis:
  * Traefik
  * Portainer
  * Wordpress

## Instruccions de desplegament

Copiar el codi descrit a continuació per a cadascún dels nodes.

### Master

```
curl -O https://raw.githubusercontent.com/rangelet88/swarm_deploy/master/run-master.sh | sudo bash -x
```

### Workers

```
curl -O https://raw.githubusercontent.com/rangelet88/swarm_deploy/master/run-worker.sh | sudo bash -x
```

### Deploy dels serveis

Un cop instal·lat docker a cadascún dels nodes i creat el clúster de Swarm, executar el següent
script al node màster:

```
curl -O https://raw.githubusercontent.com/rangelet88/swarm_deploy/master/run-deploy.sh | sudo bash -x
```
