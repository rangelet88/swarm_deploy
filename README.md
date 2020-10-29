# swarm_deploy

Desplegament automatitzat d'una infraestructura Docker Swarm amb els següents serveis:
  * Portainer
  * Traefik
  * Wordpress

## Instruccions de desplegament

Copiar el codi descrit a continuació per a cadascún dels nodes.

### Master

```
curl https://raw.githubusercontent.com/rangelet88/swarm_deploy/main/run-master.sh | sudo bash
```

### Workers

```
curl https://raw.githubusercontent.com/rangelet88/swarm_deploy/main/run-worker.sh | sudo bash
```

Un cop instal·lat docker a cadascún dels nodes i creat el clúster de Swarm, executar el següent
script al node màster:

### Deploy dels serveis

Al node màster!:
```
curl https://raw.githubusercontent.com/rangelet88/swarm_deploy/main/run-deploy.sh | sudo bash
```
