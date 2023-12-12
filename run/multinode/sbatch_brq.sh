#!/bin/bash

#SBATCH --job-name=bmn   # nom du job
#SBATCH --nodes=3
#SBATCH --account=nkp@a100
#SBATCH -C a100
# SBATCH --partition=gpu_p4
#SBATCH --gres=gpu:8
#SBATCH --cpus-per-task=10
#SBATCH --exclusive
#SBATCH --time=20:00:00          # temps d'exécution maximum demande (HH:MM:SS) 
#SBATCH --output=log/brq_%j.log  # log file


cd /gpfswork/rech/nkp/uaj64gk/bestrqexp/bestrq/run/multinode
srun run_brq.sh
