#!/bin/bash
  
#SBATCH --job-name=brqb   # nom du job
#SBATCH --account=nkp@a100
#SBATCH -C a100
#SBATCH --gres=gpu:8
#SBATCH --cpus-per-task=16
#SBATCH --exclusive
#SBATCH --time=20:00:00          # temps d'exécution maximum demande (HH:MM:SS) 
#SBATCH --output=log/w2v2_%j.log  # log file

module load pytorch-gpu/py3/2.0.1
conda activate bestrqenv

cd /gpfswork/rech/nkp/uaj64gk/bestrqexp/bestrq

python -m torch.distributed.run --nproc_per_node=8 --rdzv_backend c10d --rdzv-endpoint=localhost:0 wav2vec2/train_sb_wav2vec2.py wav2vec2/hparams/wav2vec2_base.yaml --find_unused_parameters --bfloat16_mix_prec
