#!/bin/bash

# Define image name
IMAGE="repbioinfo_biohackaton.sif"

# Build the SIF image from DockerHub if not already present
if [ ! -f "$IMAGE" ]; then
  echo "⏳ Pulling Docker image and converting to Singularity..."
  singularity pull "$IMAGE" docker://repbioinfo/biohackaton
fi

# Run the container with current directory mounted as /sharedFolder
singularity exec \
  --bind "$(pwd)":/sharedFolder \
  --env JUPYTER_TOKEN=biohack123 \
  "$IMAGE" \
  jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --ServerApp.root_dir=/

