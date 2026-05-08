FROM codercom/code-server:latest

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
  && curl -fsSL https://deb.nodesource.com/setup_24.x | bash - \
  && apt-get install -y --no-install-recommends \
    bubblewrap \
    python3 \
    python3-pip \
    python3-venv \
    ansible \
    jq \
    nodejs \
  && pip3 install --no-cache-dir --break-system-packages \
    pre-commit \
    playwright \
    pytest \
    pytest-playwright \
    uvicorn \
  && playwright install-deps chromium \
  && python3 -m playwright install chromium \
  && rm -rf /var/lib/apt/lists/* /tmp/*

ENV PATH="/root/.local/bin:${PATH}"
