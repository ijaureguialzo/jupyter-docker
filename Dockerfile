ARG JUPYTER_IMAGE=quay.io/jupyter/scipy-notebook:latest

FROM ${JUPYTER_IMAGE}

RUN pip install opencv-python
