#!/bin/bash

#SBATCH --job-name=wvbra   # nom du job
#SBATCH --account=nkp@v100
#SBATCH --constraint v100-32g
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=8
#SBATCH --time=20:00:00          # temps d'exécution maximum demande (HH:MM:SS) 
#SBATCH --output=log/brqds_%j.log  # log file

module load pytorch-gpu/py3/2.0.1
conda activate bestrqenv

cd /gpfswork/rech/nkp/uaj64gk/bestrqexp/bestrq

python /gpfswork/rech/nkp/uaj64gk/bestrqexp/benchmark/benchmarks/MP3S/LibriSpeech/LSTM/train_w2v2.py /gpfswork/rech/nkp/uaj64gk/bestrqexp/benchmark/benchmarks/MP3S/LibriSpeech/LSTM/hparams/ssl_w2v2.yaml \
    --data_folder /gpfsscratch/rech/nkp/uaj64gk/corpus/LibriSpeech/ \
    --ssl_hub /gpfswork/rech/nkp/uaj64gk/bestrqexp/jz/w2v2/CKPT+2023-12-06+08-46-56+00 \
    --seed 1001 \
    --language_modelling False --ngram_lm_path /gpfswork/rech/nkp/uaj64gk/bestrqexp/4-gram.arpa.gz    
    # --test_only --language_modelling True --ngram_lm_path /gpfswork/rech/nkp/uaj64gk/bestrqexp/4-gram.arpa.gz


    # 100K --ssl_hub /gpfswork/rech/nkp/uaj64gk/bestrqexp/jz/w2v2/CKPT+2023-12-02+02-18-36+00 