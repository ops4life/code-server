# code-server

Custom [code-server](https://github.com/coder/code-server) Docker image built on top of `codercom/code-server:latest`, with added Python tooling.

## What's included

- `python3`, `python3-pip`, `python3-venv`
- `jq`
- `pre-commit`

## Image

```
ops4life/code-server:latest
```

## Usage

```bash
docker pull ops4life/code-server:latest
docker run -it -p 8080:8080 ops4life/code-server:latest
```

Then open [http://localhost:8080](http://localhost:8080) in your browser.

## Local build

```bash
docker build -t code-server:local .
docker run -it --rm -p 8080:8080 code-server:local
```

## CI/CD

Pushes to `main` automatically build and push to Docker Hub:

- `ops4life/code-server:latest`
- `ops4life/code-server:<git-sha>`

A scheduled build runs every Monday at 06:00 UTC to pick up upstream base image updates.

Workflow: `.github/workflows/docker-publish.yml`

Required secrets: `DOCKER_USERNAME`, `DOCKER_PASSWORD`
