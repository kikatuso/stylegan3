#!/bin/bash
source ./preface.sh


folder='/gpfs3/well/papiez/users/zwk579/Results/stylegan3/log/stylegan3-ukb/00017-stylegan3-t-256x256px-gpus1-batch16-gamma10'
file="network-snapshot-000080.pkl"
resume_path="${folder}/${file}"

resume_kimg=$(echo "$file" | sed -n 's/.*-\([0-9]\{6\}\)\.pkl/\1/p' | sed 's/^0*//')
# Fallback to 0 if empty
if [ -z "$resume_kimg" ]; then
    resume_kimg=0
fi


python train.py \
  --outdir /gpfs3/well/papiez/users/zwk579/Results/stylegan3/log \
  --modelname stylegan3-ukb \
  --cfg stylegan3-t \
  --data /gpfs3/well/papiez/users/zwk579/.temp_data/256x256px \
  --gpus 1 \
  --batch 16 \
  --gamma 10.0 \
  --kimg 3000 \
  --snap 10 \
  --resume $resume_path \
  --resume_kimg $resume_kimg \
  --metrics none 