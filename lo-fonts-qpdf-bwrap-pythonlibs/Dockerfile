ARG BASE_IMAGE=ghcr.io/milan-qorvo/databricks-libreoffice:v6-standard-lo-fonts-qpdf-bwrap
FROM ${BASE_IMAGE}

USER root
ENV PLAYWRIGHT_BROWSERS_PATH=/ms-playwright

COPY requirements.txt /tmp/requirements.txt

RUN apt-get update && \
    /databricks/python3/bin/python -m pip install --no-cache-dir \
      -r /tmp/requirements.txt && \
    /databricks/python3/bin/python -m playwright install --with-deps && \
    chmod -R 755 /ms-playwright && \
    rm -rf /var/lib/apt/lists/* /tmp/requirements.txt

ENV HOME=/tmp
