# Projet Cloud Computing - Déploiement d'une API sur Azure

Ce projet a pour objectif de déployer une API Python avec FastAPI sur Microsoft Azure. L'infrastructure est configurée via Terraform, et le pipeline CI/CD est géré avec GitHub Actions.


# Examples API

Simple API that returns example records from a database.

## Prerequisites

- you need to install [uv](https://docs.astral.sh/uv/guides/install-python/)
- you must have a PostgreSQL instance available with an `example` table
- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [Docker](https://www.docker.com/products/docker-desktop/)
- Un compte Microsoft Azure
- Secrets GitHub configurés (voir section ci-dessous)


## Installation

```shell
# Install Python in the right version
uv python install

# Install dependencies and create virtual env
uv sync
```
## Structure du projet
/junia-isen-examples-api 
    /.github 
    /workflows  # Fichiers CI/CD pour GitHub Actions
    
    /examples 
        /examples.py # Code source de l'API 
    /infrastructure 
        /modules 
            /app_service # Configuration Terraform pour App Service 
                /main.tf # Logiciel pour déployer un App Service 
                /variables.tf # Variables utilisées dans le module App Service 
            /blob_storage # Configuration Terraform pour Blob Storage 
                /main.tf # Logiciel pour gérer le stockage d'objets 
                /variables.tf # Variables utilisées dans le module Blob Storage 
            /database # Configuration Terraform pour PostgreSQL 
                /main.tf # Logiciel pour déployer la base de données 
                /variables.tf # Variables utilisées dans le module Database 
            /vnet # Configuration Terraform pour le VNet 
                /main.tf # Logiciel pour configurer le réseau virtuel 
                /variables.tf # Variables utilisées dans le module VNet 
        /main.tf # Fichier principal Terraform 
        /terraform.tfvars # Fichier contenant les valeurs des variables Terraform 
        /variables.tf # Déclaration des variables globales Terraform 
        /Dockerfile # Dockerfile pour construire l'image Docker de l'API 
        /uv.lock # Fichier de dépendances pour le gestionnaire uv README.md #

## Run

```shell
# Export environment variables to connect to the PostgreSQL database...
export DATABASE_HOST=
export DATABASE_PORT=
export DATABASE_NAME=
export DATABASE_USER=
export DATABASE_PASSWORD='' # Use single quotes to avoid shell interpolation with characters like $ or #
# ...and the storage account
export STORAGE_ACCOUNT_URL=

# Run the application
uv run fastapi dev examples/examples.py
```

## Run tests

```
uv run pytest tests/
```

They go on:

- http://localhost:8000/docs
- http://localhost:8000/
- http://localhost:8000/examples
