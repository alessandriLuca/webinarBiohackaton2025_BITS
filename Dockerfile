FROM satijalab/seurat:latest


LABEL maintainer="luca.alessandri@example.org"

# Install Python, JupyterLab, notebook, IRkernel
RUN apt-get update && apt-get install -y \
    python3-pip python3-dev curl libzmq3-dev \
    && pip3 install --no-cache-dir jupyterlab notebook \
    && Rscript -e "install.packages('IRkernel', repos='https://cloud.r-project.org'); IRkernel::installspec(user = FALSE)"

# Set password for Jupyter (biohack123)
RUN mkdir -p /root/.jupyter && \
    python3 -c "from jupyter_server.auth import passwd; print(\"c.ServerApp.password = u'\" + passwd('biohack123') + \"'\")" \
    > /root/.jupyter/jupyter_lab_config.py

# Optional: create working directory
WORKDIR /home/project

# Expose JupyterLab
EXPOSE 8888
RUN pip install scanpy


RUN pip uninstall -y numba llvmlite
RUN pip install numba==0.56.4 llvmlite==0.39.1
RUN pip install igraph leidenalg
RUN pip install louvain


# Launch JupyterLab and show entire filesystem (rooted at /)
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--ServerApp.root_dir=/"]
