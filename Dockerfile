FROM databricksruntime/standard:17.3-LTS

USER root

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      libreoffice \
      fontconfig \
      fonts-dejavu-core \
    && rm -rf /var/lib/apt/lists/*

ENV HOME=/tmp