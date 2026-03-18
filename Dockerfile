FROM codercom/code-server:latest

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv \
    jq \
  && pip3 install --no-cache-dir --break-system-packages pre-commit \
  && rm -rf /var/lib/apt/lists/*
