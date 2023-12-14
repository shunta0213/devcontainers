#!bin/bash

if [ $1 -eq "GPU" ]; then
  DEVICE="GPU"
  echo "Installing PyTorch CUDA"
else
  DEVICE="CPU"
  echo "Installing PyTorch CPU"
fi

# TODO: support GPU
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

echo "Finished installing PyTorch"
