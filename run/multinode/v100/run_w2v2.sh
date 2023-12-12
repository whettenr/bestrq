#!/bin/bash

module load pytorch-gpu/py3/2.0.1
conda activate bestrqenv

cd /gpfswork/rech/nkp/uaj64gk/bestrqexp/bestrq

# We extract the master node address (the one that every node must connects to)
LISTNODES=`scontrol show hostname $SLURM_JOB_NODELIST`
MASTER=`echo $LISTNODES | cut -d" " -f1`

# here --nproc_per_node=4 because we want torchrun to spawn 4 processes (4 GPUs). Then we give the total amount of nodes requested (--nnodes) and then --node_rank that is necessary to dissociate the node that we are calling this from.
python -m torch.distributed.run --nproc_per_node=4 --nnodes=${SLURM_JOB_NUM_NODES} --node_rank=${SLURM_NODEID} --master_addr=${MASTER} --master_port=5555 wav2vec2/train_sb_wav2vec2.py wav2vec2/hparams/wav2vec2_bb.yaml \
    --find_unused_parameters --output_folder results/wav2vec2-bb-v100 --grad_accumulation_factor=1
