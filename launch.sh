#!/bin/bash

# PATH DEFINITIONS
# Modify according to your username and configuration
WORK_PATH="/data/scratch/$( whoami )/processing"
OUTPUT_PATH="/data/scratch/$( whoami )/output" 
ERROR_PATH="/data/scratch/$( whoami )/errormsgs"

if [ ! -d "$WORK_PATH" ]; then mkdir -p $WORK_PATH; fi
if [ ! -d "$OUTPUT_PATH" ]; then mkdir -p $OUTPUT_PATH; fi
if [ ! -d "$ERROR_PATH" ]; then mkdir -p $ERROR_PATH; fi

# PYTHON file
# Path and name of the python file to be executed
python_file="/home/loibldav/Git/keras-slurm/keras-test.py"    



# Only edit lines below here if you know what you are doing ...
#SBATCH --job-name="Python Test"
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=10
#SBATCH --workdir=$WORK_PATH
#SBATCH --output=$OUTPUT_PATH
#SBATCH --error=$ERROR_PATH
#SBATCH --qos=medium
#SBATCH --account=$ACCOUNT

echo $SLURM_CPUS_ON_NODE

export PATH="/nfsdata/programs/anaconda3/bin:$PATH"
python $python_file
