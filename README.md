# databricks-libreoffice

Custom Databricks Runtime Docker images with [LibreOffice](https://www.libreoffice.org/) (and optional add-ons) pre-installed, hosted on GitHub Container Registry (GHCR).

These images are built on top of:

- `databricksruntime/standard:17.3-LTS`

`HOME` is set to `/tmp` to satisfy LibreOffice's requirement for a writable home directory in the Databricks execution environment.

## Image variants (dependency tree)

```text
databricksruntime/standard:17.3-LTS
            |
            v
ghcr.io/milan-qorvo/databricks-libreoffice:17.3-lts-lo
  (LibreOffice)
            |
            v
ghcr.io/milan-qorvo/databricks-libreoffice:17.3-lts-lo-fonts
  (LibreOffice + fonts)
            |
            v
ghcr.io/milan-qorvo/databricks-libreoffice:17.3-lts-lo-fonts-qpdf
  (LibreOffice + fonts + qpdf)
```

## Building locally

The images must be built in order, since each variant uses the previous one as its base. Pass the locally built tag via the `BASE_IMAGE` build arg for the dependent images.

**1. lo** (LibreOffice)

```bash
docker build -t databricks-libreoffice:17.3-lts-lo -f lo/Dockerfile .
```

**2. lo-fonts** (LibreOffice + fonts)

```bash
docker build \
  --build-arg BASE_IMAGE=databricks-libreoffice:17.3-lts-lo \
  -t databricks-libreoffice:17.3-lts-lo-fonts \
  -f lo-fonts/Dockerfile .
```

**3. lo-fonts-qpdf** (LibreOffice + fonts + qpdf)

```bash
docker build \
  --build-arg BASE_IMAGE=databricks-libreoffice:17.3-lts-lo-fonts \
  -t databricks-libreoffice:17.3-lts-lo-fonts-qpdf \
  -f lo-fonts-qpdf/Dockerfile .
```