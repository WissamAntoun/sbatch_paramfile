#!/bin/bash
#SBATCH --job-name=test_job     # Name of job
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1          # number of MPI tasks per node (= number of GPUs per node)
#SBATCH --hint=nomultithread         # hyperthreading deactivated
#SBATCH --time=00:01:00              # maximum execution time requested (HH:MM:SS)
#SBATCH --output=./logs/%x%j.out # name of output file
#SBATCH --error=./logs/%x%j.out  # name of error file (here, in common with the output file)
#SBATCH --array=1-4

args=$(sed -n ${SLURM_ARRAY_TASK_ID}p $1)
echo "Running with the following parameters:"
echo $args
IFS=' ' read -r -a array <<< $args
var1=${array[0]}
var2=${array[1]}
var3=${array[2]}

echo "var1: $var1"
echo "var2: $var2"
echo "var3: $var3"