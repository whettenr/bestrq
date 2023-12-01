#!/bin/bash

#SBATCH --job-name=brqhc   # nom du job
#SBATCH --account=nkp@v100
#SBATCH --constraint v100-32g
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=8
#SBATCH --time=20:00:00          # temps d'exécution maximum demande (HH:MM:SS) 
#SBATCH --output=log/brqds_%j.log  # log file

module load pytorch-gpu/py3/2.0.1
conda activate bestrqenv

cd /gpfswork/rech/nkp/uaj64gk/bestrqexp/bestrq

python /gpfswork/rech/nkp/uaj64gk/bestrqexp/benchmark/benchmarks/MP3S/LibriSpeech/LSTM/train_brq.py /gpfswork/rech/nkp/uaj64gk/bestrqexp/benchmark/benchmarks/MP3S/LibriSpeech/LSTM/hparams/ssl_brq_hyperconformer.yaml \
    --data_folder /gpfsscratch/rech/nkp/uaj64gk/corpus/LibriSpeech/ \
    --ssl_hub /gpfswork/rech/nkp/uaj64gk/bestrqexp/jz/brqhc/CKPT+2023-12-01+15-51-27+00 \

