ARG BASE_IMAGE=ghcr.io/milan-qorvo/databricks-libreoffice:v6-standard-lo-fonts-qpdf
FROM ${BASE_IMAGE}

USER root
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      bubblewrap \
    && rm -rf /var/lib/apt/lists/*
ENV HOME=/tmp
