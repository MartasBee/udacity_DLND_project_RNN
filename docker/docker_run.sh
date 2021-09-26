#!/bin/bash

xhost +si:localuser:$USER

docker run --gpus '"device=1","capabilities=compute,graphics,display,utility"' \
  -it --rm \
  --ipc=host \
  -p 6006:6006 \
  -p 8888:8888 \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /home/martin/devel/github/martasbee/udacity_DLND_project_RNN:/workspace/DLND/repo \
  -v /home/martin/devel/data:/workspace/DLND/data \
  nvcr.io/nvidia/pytorch:21.05-py3 bash
