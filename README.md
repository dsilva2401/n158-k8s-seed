# n158-k8s-seed

Seed with n158 using kubernetes

## Requirements

- Docker
- kubectl client
- Kubernetes server running

> Remember to setup the kubernetes connection data inside `connection-config.yaml` file

> Follow this [link](https://kubernetes.io/docs/tasks/tools/install-kubectl/) to install kubectl if not installed

## Initial setup

Install dependencies
`npm install`

Replace default variables from `Makefile` and `k8s-manifest.yaml` with your project settings

## Start locally

Build the image
`make build`

Start server for development
`make start`

Server will be available at [http://localhost:3000](http://localhost:3000)

## Deployment

> Remember to update `CURRENT_VERSION` with the new one inside `Makefile`

To publish image and deploy changes execute `make deploy`
