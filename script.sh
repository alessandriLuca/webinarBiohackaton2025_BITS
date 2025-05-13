#!/bin/bash

# Avvia il container Docker montando la cartella corrente come /sharedFolder
docker run -it --rm \
  -p 8888:8888 \
  -v "$(pwd)":/sharedFolder \
  repbioinfo/biohackaton

