FROM codercom/code-server:latest

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv \
    jq \
    nodejs \
    npm \
  && pip3 install --no-cache-dir --break-system-packages \
    pre-commit \
    playwright \
    pytest-playwright \
    uvicorn \
  && playwright install-deps chromium \
  && npx --yes playwright install chrome \
  && rm -rf /var/lib/apt/lists/*

ENV PATH="/root/.local/bin:${PATH}"
