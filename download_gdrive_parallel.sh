#! /bin/bash

#SBATCH --job-name download_gdrive
#SBATCH --nodes=1
#SBATCH --nodelist=node2 #used node2
#SBATCH -t 80:00:00 # Time for running job #길게 10일넘게 잡음
#SBATCH -o ./slurm_files/output_%A-%a.out #%J : job id 가 들어가는 것
#SBATCH -e ./slurm_files/error_%A-%a.error
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=1GB
#SBATCH --cpus-per-task=1
#SBATCH --array=1-22%7 #총 갯수 of the IDs

#gdown 을 이미 켜놓은 conda 환경이라고 가정함
#source ~/.bashrc
#conda activate /home/connectome/dyhan316/.conda/envs/download_ABCD
#conda init bash
source /usr/anaconda3/etc/profile.d/conda.sh
#source activate download_ABCD
conda activate download_ABCD #this has gdown inside 

ID=`cat file_id_list.txt | awk -v var=${SLURM_ARRAY_TASK_ID} 'NR==var'`


echo $ID

gdown $ID
