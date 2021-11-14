#!/bin/bash
#SBATCH --job-name=training
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --output=resnet56_rtx8000
#SBATCH --mem=16GB
#SBATCH --time=4:00:00
#SBATCH --gres=gpu:rtx8000:1

module purge
module load anaconda3/2020.07
eval "$(conda shell.bash hook)"
conda activate idl
cd /home/mg6827/convNet.pytorch/
srun -l python main.py --dataset cifar10 --model resnet --model-config "{'depth': 56}" -b 128 --epochs 350 --save resnet18_rtx8000:1
