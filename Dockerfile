FROM codercom/code-server:latest

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
  && curl -fsSL https://deb.nodesource.com/setup_24.x | bash - \
  && curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg -o /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" > /etc/apt/sources.list.d/github-cli.list \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    bubblewrap \
    cron \
    python3 \
    python3-pip \
    python3-venv \
    ansible \
    jq \
    ripgrep \
    nodejs \
    gh \
  && pip3 install --no-cache-dir --break-system-packages \
    pre-commit \
    playwright \
    pytest \
    pytest-playwright \
    uvicorn \
  && PLAYWRIGHT_BROWSERS_PATH=/usr/local/share/playwright playwright install-deps chromium \
  && PLAYWRIGHT_BROWSERS_PATH=/usr/local/share/playwright python3 -m playwright install chromium \
  && printf "# docker shortcuts\nalias dc='docker compose'\nalias dcr='docker compose restart'\nalias dx='docker compose up -d --build'\n" > /etc/profile.d/docker_aliases.sh \
  && usermod -l ubuntu coder \
  && usermod -d /home/ubuntu -m ubuntu \
  && groupmod -n ubuntu coder \
  && printf "\n# docker shortcuts\nalias dc='docker compose'\nalias dcr='docker compose restart'\nalias dx='docker compose up -d --build'\n" >> /home/ubuntu/.bashrc \
  && rm -rf /var/lib/apt/lists/* /tmp/*

ENV PATH="/home/ubuntu/.local/bin:${PATH}"
ENV PLAYWRIGHT_BROWSERS_PATH=/usr/local/share/playwright
