ARG BASE_IMAGE=ghcr.io/milan-qorvo/databricks-libreoffice:v6-standard-lo
FROM ${BASE_IMAGE}

USER root
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      fontconfig \
      fonts-dejavu-core \
    && rm -rf /var/lib/apt/lists/*
ENV HOME=/tmp
