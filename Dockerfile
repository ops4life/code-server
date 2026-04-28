FROM codercom/code-server:latest

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv \
    jq \
    nodejs \
    npm \
  && pip3 install --no-cache-dir --break-system-packages pre-commit \
  && ln -s /opt/vps-apps/scripts/docling.sh /usr/local/bin/docling \
  && rm -rf /var/lib/apt/lists/*

ENV PATH="/root/.local/bin:${PATH}"
