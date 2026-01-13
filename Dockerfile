ARG JUPYTER_IMAGE=quay.io/jupyter/scipy-notebook:latest

FROM ${JUPYTER_IMAGE}

USER root

RUN apt update && apt dist-upgrade -y

RUN apt install -y links2

USER jovyan

RUN pip install jupyterlab-language-pack-es-ES

RUN pip install opencv-python ultralytics
