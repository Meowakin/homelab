FROM python:3.13-slim

RUN apt-get update \
 && apt-get install -y --no-install-recommends openssh-client git \
 && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

WORKDIR /work
ENTRYPOINT ["/bin/sh", "-c", "if [ -f /tmp/ansible_key ]; then mkdir -p /root/.ssh && cp /tmp/ansible_key /root/.ssh/id_ed25519 && chmod 600 /root/.ssh/id_ed25519; fi; exec \"$@\"", "--"]