#!/bin/bash

#SBATCH --job-name=brqb   # nom du job
#SBATCH --account=nkp@v100
#SBATCH --constraint v100-32g
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=8
#SBATCH --time=20:00:00          # temps d'exécution maximum demande (HH:MM:SS) 
#SBATCH --output=log/brqds_%j.log  # log file

module load pytorch-gpu/py3/2.0.1
conda activate bestrqenv

cd /gpfswork/rech/nkp/uaj64gk/bestrqexp/bestrq

python /gpfswork/rech/nkp/uaj64gk/bestrqexp/bestrq/finetune/brq/finetune_bestrq.py /gpfswork/rech/nkp/uaj64gk/bestrqexp/bestrq/finetune/brq/finetune_bestrq.yaml \
    --data_folder /gpfsscratch/rech/nkp/uaj64gk/corpus/LibriSpeech/ \
    --pt_model_hub /gpfswork/rech/nkp/uaj64gk/bestrqexp/jz/brqwide \
    --d_model 768 --pt_model_output_dim 768 --seed 5010 \
    --use_language_modelling False --ngram_lm_path /gpfswork/rech/nkp/uaj64gk/bestrqexp/4-gram.arpa.gz

    # --test_only --use_language_modelling True --ngram_lm_path /gpfswork/rech/nkp/uaj64gk/bestrqexp/4-gram.arpa.gz