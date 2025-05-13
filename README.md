# 🧬 Biohackaton – Single-cell Analysis Environment

This repository provides a complete Docker-based setup for analyzing single-cell RNA-seq data from [GSE150728](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE150728), integrating both **R (Seurat)** and **Python (Scanpy + scVAG)** workflows in a unified JupyterLab environment.

---

## 🚀 Quick Start

### 🧱 Build the Docker image  (optional, you can simply download the image automatically through the script that you will find later)

Use the provided `Dockerfile` to build the container:

```bash
docker build -t repbioinfo/biohackaton .
```

---

### 🧪 Run the container with mounted data folder  (This command is automatically performed by the script.sh or script.cmd, so simply run one of them according if you are on ubuntu/Mac OSX or windows)

Running the script the system folder will be automatically mounted and jupyter will be accessible through your browser. If you are on windows or MACos please, be sure to run docker before running the script. Script terminal window needs to stay open for the entire process. 

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
- ✅ JupyterLab (Python + R kernels)

---

## 📁 Data Used

We analyzed raw single-cell expression data from:

**[GSE150728 – NCBI GEO](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE150728)**  

Download and pre-process these data into Matrix Market format (`.mtx`, `.tsv`) or use existing `.h5ad`/`.rds` files.

---

## 🧪 Scripts

All analysis scripts are located in `/sharedFolder`:
- `0_DownloadData.ipynb` – Download data and organize them in /sharedFolder/Data (R)
- `1_PreprocessingData.ipynb` – Merge all samples and generate a sparse matrix (mtx) file, converting the input rds that is a Seurat only standard. (R)
- `scanpy_analysis.ipynb` – PCA, clustering, UMAP (Python)
- `seurat_analysis.ipynb` – standard Seurat pipeline (R)
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
