# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This repo builds a custom `code-server` Docker image on top of `codercom/code-server:latest`, adding Python tooling (`pre-commit`, `jq`). The image is published to Docker Hub as `ops4life/code-server`.

## CI/CD

- Pushes to `main` automatically trigger a GitHub Actions build and push to Docker Hub (`ops4life/code-server:latest` and `ops4life/code-server:<sha>`).
- Required GitHub secrets: `DOCKER_USERNAME`, `DOCKER_PASSWORD`.
- Workflow file: `.github/workflows/docker-publish.yml`

## Local Build & Test

```bash
docker build -t code-server:local .
docker run -it --rm code-server:local
```

## Key Notes

- Base image is Debian 12 (bookworm) — use `--break-system-packages` when running `pip3 install` in the Dockerfile due to PEP 668.
- Git identity for this repo: `ops4life <admin@ops4life.com>`
