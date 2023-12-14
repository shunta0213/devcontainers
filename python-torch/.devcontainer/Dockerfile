FROM mcr.microsoft.com/vscode/devcontainers/python:3.9-bullseye

ARG DEVICE="cpu"

RUN pip install --upgrade pip

# PyTorch
COPY ./scripts/ /tmp/scripts/
RUN sudo chmod +x /tmp/scripts/pytorch.sh;\
  set +x ;\
  /tmp/scripts/pytorch.sh ${DEVICE}

# Other packages through pip
RUN pip install jupyter