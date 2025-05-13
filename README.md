# 🧬 Biohackaton – Single-cell Analysis Environment

This repository provides a complete Docker-based setup for analyzing single-cell RNA-seq data from [GSE150728](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE150728), integrating both **R (Seurat)** and **Python (Scanpy + scVAG)** workflows in a unified JupyterLab environment.

---

## 🚀 Quick Start

### 🧱 Build the Docker image

Use the provided `Dockerfile` to build the container:

```bash
docker build -t repbioinfo/biohackaton .
```

---

### 🧪 Run the container with mounted data folder

This will mount your current working directory into `/sharedFolder` inside the container and launch JupyterLab:

```bash
docker run -it --rm -p 8888:8888 -v "$PWD":/sharedFolder repbioinfo/biohackaton
```

📂 The full filesystem is accessible inside JupyterLab (`--ServerApp.root_dir=/`).

---

## 🔐 JupyterLab Access

Once the container is running, open your browser to:

```
http://localhost:8888
```

Use the password:  
```plaintext
biohack123
```

---

## 🧰 Environment Features

This image includes:

- ✅ **Seurat (latest)** in R
- ✅ **Scanpy** with `leiden`, `louvain`, `igraph`, etc.
- ✅ **scVAG**: Graph-based Variational Autoencoder for single-cell clustering
- ✅ JupyterLab (Python + R kernels)
- ✅ Access to full filesystem

---

## 📁 Data Used

We analyzed raw single-cell expression data from:

**[GSE150728 – NCBI GEO](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE150728)**  
> "Human B cell leukemia samples profiled with single-cell RNA-seq"

Download and pre-process these data into Matrix Market format (`.mtx`, `.tsv`) or use existing `.h5ad`/`.rds` files.

---

## 🧪 Scripts

All analysis scripts are located in `/sharedFolder`:

- `scanpy_analysis.py` – PCA, clustering, UMAP (Python)
- `seurat_analysis.R` – standard Seurat pipeline (R)
- `scVAG_run.py` – latent space clustering using graph attention autoencoder

---

## 🧼 Cleanup

To stop the container:

```bash
CTRL+C
```

To remove all temporary Docker containers:

```bash
docker system prune -f
```

---

## 🧠 Credits

Developed for [Biohackaton 2025] – Luca Alessandri (repbioinfo), University of Torino.
