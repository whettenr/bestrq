#!/bin/bash

#SBATCH --job-name=wmn   # nom du job
#SBATCH --nodes=4
#SBATCH --account=nkp@a100
#SBATCH -C v100-32g
# SBATCH --partition=gpu_p4
#SBATCH --gres=gpu:4
#SBATCH --cpus-per-task=10
#SBATCH --exclusive
#SBATCH --time=100:00:00          # temps d'exécution maximum demande (HH:MM:SS) 
#SBATCH --output=log/w2v2_%j.log  # log file


cd /gpfswork/rech/nkp/uaj64gk/bestrqexp/bestrq/run/multinode/v100
srun run_w2v2.sh
