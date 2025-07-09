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

echo "Python include paths set to:"
echo "CPATH: $CPATH"
echo "CPLUS_INCLUDE_PATH: $CPLUS_INCLUDE_PATH"
