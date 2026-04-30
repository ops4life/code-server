FROM codercom/code-server:latest

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv \
    jq \
  && pip3 install --no-cache-dir --break-system-packages \
    pre-commit \
    playwright \
    pytest-playwright \
    uvicorn \
  && playwright install-deps chromium \
  && python3 -m playwright install chromium \
  && rm -rf /var/lib/apt/lists/* /tmp/*

ENV PATH="/root/.local/bin:${PATH}"
