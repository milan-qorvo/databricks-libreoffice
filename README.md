# databricks-libreoffice

A custom Databricks Runtime Docker image with [LibreOffice](https://www.libreoffice.org/) pre-installed, hosted on GitHub Container Registry (GHCR).

## What's included

Built on top of `databricksruntime/standard:17.3-LTS` with the following additions:

- **LibreOffice** — full office suite for headless document processing (e.g. converting `.docx`/`.xlsx` to PDF)
- **fontconfig** — font configuration and rendering library
- **fonts-dejavu-core** — base font set for consistent rendering

`HOME` is set to `/tmp` to satisfy LibreOffice's requirement for a writable home directory in the Databricks execution environment.

## Image

```
ghcr.io/milan-qorvo/databricks-libreoffice:17.3-lts
```

## Usage on Databricks

To use this image as the runtime for a Databricks cluster:

1. On the **Create compute** page, set **Databricks Runtime Version** to `17.3 LTS`.
2. Expand **Advanced options** and select the **Docker** tab.
3. Select **Use your own Docker container**.
4. In the **Docker Image URL** field, enter:
   ```
   ghcr.io/milan-qorvo/databricks-libreoffice:17.3-lts
   ```
5. Leave **Authentication** as `Default` (the image is public).

## Building locally

```bash
docker build -t databricks-libreoffice:17.3-lts .
```
