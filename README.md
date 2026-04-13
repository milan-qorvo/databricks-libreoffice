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