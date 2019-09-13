# n158-k8s-seed

Seed with n158 using kubernetes

## Requirements

- Docker
- Kubernetes server running

> Remember to setup the kubernetes connection data inside `connection-config.yaml` file

## Initial setup

Install dependencies
`npm install`

Replace `IMAGE_NAME` and `ACCOUNT_NAME` variables inside `Makefile`

## Start locally

Build the image
`make build`

Start server for development
`make start`

Server will be available at [http://localhost:3000](http://localhost:3000)

## Deployment

> Remember to update `CURRENT_VERSION` with the new one inside `Makefile`
