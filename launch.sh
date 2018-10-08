#!/bin/bash

OUTPUT_PATH="/home/loibldav/output"     # Modify to your username and demands
ERROR_PATH="/home/loibldav/errormsgs"   # Modify to your username and demands
python_file="/home/loibldav/test.py"    # Path and name of the python file to be executed

#SBATCH --job-name="Python Test"
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --output=$OUTPUT_PATH
#SBATCH --error=$ERROR_PATH
#SBATCH --qos=medium
#SBATCH --account=$ACCOUNT

echo $SLURM_CPUS_ON_NODE

export PATH="/nfsdata/programs/anaconda3/bin:$PATH"
python $python_file
