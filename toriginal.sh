#!/bin/bash -l              
#SBATCH --partition=cuda.q
#SBATCH -w aolin23
#SBATCH --exclusive

# print information for documentation
echo "Compile original for CPU execution"

# install gcc compiler
module load gcc/10.2.0
echo

# compile for CPU
gcc -O3 original.c -o original

# execute and measure total time and general performance counters
perf stat -e cycles,instructions original

#perf record original
echo