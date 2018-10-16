#!/bin/bash

# PATH DEFINITIONS
# Modify according to your username and configuration
WORK_PATH="/data/scratch/$( whoami )/processing"
OUTPUT_PATH="/data/scratch/$( whoami )/output" 
ERROR_PATH="/data/scratch/$( whoami )/errormsgs"
LOG_PATH="/data/scratch/$( whoami )/log"

# Choose a job name that will identify this run in log files and Slurm queue.
# Avoid spaces and special characters.
job_name="python-test"

# PYTHON file
# Path and name of the python file to be executed
python_file="$( pwd )/keras-test.py"    


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Only edit lines below here if you know what you are doing ...
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if [ ! -d "$WORK_PATH" ]; then mkdir -p $WORK_PATH; fi
if [ ! -d "$OUTPUT_PATH" ]; then mkdir -p $OUTPUT_PATH; fi
if [ ! -d "$ERROR_PATH" ]; then mkdir -p $ERROR_PATH; fi
if [ ! -d "$LOG_PATH" ]; then mkdir -p $LOG_PATH; fi

run_identifier=$( date +"%Y-%m-%d_%Hh%mm" )
log_filename=${job_name}-${run_identifier}.log
logfile=$LOG_PATH/$log_filename


#SBATCH --job-name="Python Test"
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=10
#SBATCH --workdir=$WORK_PATH
#SBATCH --output=$OUTPUT_PATH
#SBATCH --error=$ERROR_PATH
#SBATCH --qos=medium
#SBATCH --account=$ACCOUNT
#SBATCH --reservation=geox2018
#SBATCH --partition=computehm

echo $SLURM_CPUS_ON_NODE

export PATH="/nfsdata/programs/anaconda3/bin:$PATH"
python $python_file 2>&1 >>$logfile
