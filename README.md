# Deployment of OBiBa for DataSHIELD

This repository contains the necessary files to deploy an example instance of OBiBa for DataSHIELD. It uses Traefik as a reverse proxy and some self-signed certificates to generate, for **testing** purpose only.

## Prerequisites

- Docker
- Docker Compose
- Linux or MacOS

## Installation

Once you have cloned the repository, you can start the deployment by running the following command:

```bash
make certificates
make hosts
```

This will generate the necessary certificates and update your `/etc/hosts` file to include the necessary entries.

Then you can start the deployment by running:

```bash
make pull
make up
```

This will pull the necessary images and start the containers. You can access the services at the following URLs:

- Opal: [https://opal.localhost](https://opal.localhost)
- Traefik (dashboard for debug): [https://traefik.localhost](https://traefik.localhost)

To stop the deployment, you can run:

```bash
make stop
```