#!/bin/bash

# Load required modules

module load GCC/12.3.0
module load CUDA/12.1.1
module load cuDNN/8.9.2.26-CUDA-12.1.1

# # Activate your conda environment
source /apps/eb/el8/common/software/Anaconda3/2024.02-1/etc/profile.d/conda.sh
conda activate /gpfs3/well/papiez/users/zwk579/.conda_envs/myenv 

# # Set Python include paths for compiler
export CPATH=/gpfs3/well/papiez/users/zwk579/.conda_envs/myenv/include/python3.11:$CPATH
export CPLUS_INCLUDE_PATH=/gpfs3/well/papiez/users/zwk579/.conda_envs/myenv/include/python3.11:$CPLUS_INCLUDE_PATH


HOME=/gpfs3/well/papiez/users/zwk579

echo "saving model to"  $HOME/.cache/dnnlib/

## pictures of dogs - nvidia model
# python3.11 gen_images.py \
#   --modelname stylegan3-r-afhqv2-512x512 \
#   --trunc=1 \
#   --seeds=64,32,23,1 \
#   --network=https://api.ngc.nvidia.com/v2/models/nvidia/research/stylegan3/versions/1/files/stylegan3-r-afhqv2-512x512.pkl
  
# class 0 is healthy and class 1 is glaucoma
python3.11 gen_images.py \
  --modelname stylegan3-medfusion \
  --trunc=1.0 \
  --class 0 \
  --seeds 64,32,23,1,2,3,5,7 \
  --network https://huggingface.co/spaces/mueller-franzes/medfusion-app/resolve/main/runs/eye_gan/last.pkl

