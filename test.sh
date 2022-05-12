#!/bin/bash -l              
#SBATCH --partition=cuda.q
#SBATCH -w aolin23
#SBATCH --exclusive

# print information for documentation
echo "Compile CH2 for CPU execution"

# install gcc compiler
module load gcc/10.2.0
echo

# compile for CPU
gcc -O3 CH2.c -o CH2

# execute and measure total time and general performance counters
perf stat -e cycles,instructions CH2

#perf record CH2
echo