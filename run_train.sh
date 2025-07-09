#!/bin/bash

sh preface.sh

export TORCH_EXTENSIONS_DIR="/gpfs3/well/papiez/users/zwk579/.cache/torch_extensions"



python3.11 train.py \
  --outdir /gpfs3/well/papiez/users/zwk579/Results/stylegan3/log \
  --modelname stylegan3-ukb \
  --cfg stylegan3-t \
  --data /gpfs3/well/papiez/users/zwk579/.temp_data/256x256px \
  --gpus 1 \
  --batch 32 \
  --gamma 10.0 \
  --kimg 1000 \
  --snap 10 \
  --metrics fid50k_full