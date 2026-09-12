# databricks-libreoffice

Custom Databricks Runtime Docker images with [LibreOffice](https://www.libreoffice.org/) (and optional add-ons) pre-installed, hosted on GitHub Container Registry (GHCR).

These images are built on top of:

- `databricksruntime/environment:v6-standard`
- `databricksruntime/standard:18.3-LTS`

`HOME` is set to `/tmp` to satisfy LibreOffice's requirement for a writable home directory in the Databricks execution environment.

## Image variants

The same variants are published for both base images. The tag prefix identifies the base image.

### `v6-standard` variants

```text
databricksruntime/environment:v6-standard
            |
            v
ghcr.io/milan-qorvo/databricks-libreoffice:v6-standard-lo
  (LibreOffice)
            |
            v
ghcr.io/milan-qorvo/databricks-libreoffice:v6-standard-lo-fonts
  (LibreOffice + fonts)
            |
            v
ghcr.io/milan-qorvo/databricks-libreoffice:v6-standard-lo-fonts-qpdf
  (LibreOffice + fonts + qpdf)
            |
            v
ghcr.io/milan-qorvo/databricks-libreoffice:v6-standard-lo-fonts-qpdf-bwrap
  (LibreOffice + fonts + qpdf + bubblewrap)
```

### `18.3-LTS` variants

```text
databricksruntime/standard:18.3-LTS
            |
            v
ghcr.io/milan-qorvo/databricks-libreoffice:18.3-LTS-lo
  (LibreOffice)
            |
            v
ghcr.io/milan-qorvo/databricks-libreoffice:18.3-LTS-lo-fonts
  (LibreOffice + fonts)
            |
            v
ghcr.io/milan-qorvo/databricks-libreoffice:18.3-LTS-lo-fonts-qpdf
  (LibreOffice + fonts + qpdf)
            |
            v
ghcr.io/milan-qorvo/databricks-libreoffice:18.3-LTS-lo-fonts-qpdf-bwrap
  (LibreOffice + fonts + qpdf + bubblewrap)
```

## Building locally

The images must be built in order, since each variant uses the previous one as its base. Pass the locally built tag via the `BASE_IMAGE` build arg for the dependent images.

**1. lo** (LibreOffice)

```bash
docker build -t databricks-libreoffice:v6-standard-lo -f lo/Dockerfile .
```

**2. lo-fonts** (LibreOffice + fonts)

```bash
docker build \
  --build-arg BASE_IMAGE=databricks-libreoffice:v6-standard-lo \
  -t databricks-libreoffice:v6-standard-lo-fonts \
  -f lo-fonts/Dockerfile .
```

**3. lo-fonts-qpdf** (LibreOffice + fonts + qpdf)

```bash
docker build \
  --build-arg BASE_IMAGE=databricks-libreoffice:v6-standard-lo-fonts \
  -t databricks-libreoffice:v6-standard-lo-fonts-qpdf \
  -f lo-fonts-qpdf/Dockerfile .
```

**4. lo-fonts-qpdf-bwrap** (LibreOffice + fonts + qpdf + bubblewrap)

```bash
docker build \
  --build-arg BASE_IMAGE=databricks-libreoffice:v6-standard-lo-fonts-qpdf \
  -t databricks-libreoffice:v6-standard-lo-fonts-qpdf-bwrap \
  -f lo-fonts-qpdf-bwrap/Dockerfile .
```

### Building the `18.3-LTS` variants

Use the same Dockerfiles, starting with the alternate base image and using the `18.3-LTS` tag prefix:

```bash
docker build \
  --build-arg BASE_IMAGE=databricksruntime/standard:18.3-LTS \
  -t databricks-libreoffice:18.3-LTS-lo \
  -f lo/Dockerfile .

docker build \
  --build-arg BASE_IMAGE=databricks-libreoffice:18.3-LTS-lo \
  -t databricks-libreoffice:18.3-LTS-lo-fonts \
  -f lo-fonts/Dockerfile .

docker build \
  --build-arg BASE_IMAGE=databricks-libreoffice:18.3-LTS-lo-fonts \
  -t databricks-libreoffice:18.3-LTS-lo-fonts-qpdf \
  -f lo-fonts-qpdf/Dockerfile .

docker build \
  --build-arg BASE_IMAGE=databricks-libreoffice:18.3-LTS-lo-fonts-qpdf \
  -t databricks-libreoffice:18.3-LTS-lo-fonts-qpdf-bwrap \
  -f lo-fonts-qpdf-bwrap/Dockerfile .
```
