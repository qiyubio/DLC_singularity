#!/bin/bash
export OMP_NUM_THREADS=1
export LANGUAGE=en_US.UTF-8
export PYTHONNOUSERSITE=1
#export TF_FORCE_GPU_ALLOW_GROWTH=true
app=DeepLabCut
ver=2.3.4
dir="/path_to/${app}/${ver}"
Model=/usr/local/lib/python3.8/dist-packages/deeplabcut/pose_estimation_tensorflow/models/pretrained/
Local_model=/path_to/$USER/DLC/pretrained
export SINGULARITY_BIND=$Local_model:$Model
export SINGULARITYENV_LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda-11.4/compat/"
singularity exec --nv ${dir}/libexec/dlc.sif python3 "$@"
