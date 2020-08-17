# Docker Compose deployment

## Pre-Requisites

* [Docker](https://www.docker.com/get-started)
* [Docker-Compose](https://docs.docker.com/compose/install/)
* [Ping DevOps - Compose](https://pingidentity-devops.gitbook.io/devops/deploy/deploycompose)

### Configuration

Modify [Environment Variables](../environment.md)

* Copy the `docker-compose.yaml`, `env-vars` and `postman_vars.json` files to a folder
* Modify the `env-vars` file to match your environment
* Modify the `postman.json` file to match your environment

Deploy Services

* Launch the stack with `docker-compose up -d`
* Logs for the stack can be watched with `docker-compose logs -f`
* Logs for individual services can be watched with `docker-compose logs -f {service}`
