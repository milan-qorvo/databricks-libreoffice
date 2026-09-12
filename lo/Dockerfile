ARG BASE_IMAGE=databricksruntime/environment:v6-standard
FROM ${BASE_IMAGE}

USER root
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      ca-certificates \
    && echo "deb http://archive.ubuntu.com/ubuntu noble-backports main restricted universe multiverse" \
       > /etc/apt/sources.list.d/noble-backports.list \
    && apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      -t noble-backports \
      libreoffice \
    && rm -rf /var/lib/apt/lists/*

ENV HOME=/tmp
