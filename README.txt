# First install the conda environment from: allInOne_methyldackel
# Add the line to your .bashrc file: 
# export path to LD for methyldackel custom
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/data/apps/miniconda3/envs/allInOne_methyldackel/lib"

# Then activate the environment
# sudo apt-get install libz-dev # for zlib.h
# mamba install -c bioconda htslib
# Then install the modified environment by calling:
make install CFLAGS="-O3 -Wall -I/data/apps/miniconda3/envs/allInOne_methyldackel/include " prefix=/data/apps/miniconda3/envs/allInOne_methyldackel/bin LIBS="-L/data/apps/miniconda3/envs/allInOne_methyldackel/lib" LIBBIGWIG="/data/apps/miniconda3/envs/allInOne_methyldackel/lib/libBigWig.a"

# LD_LIBRARY_PATH=/lib/x86_64-linux-gnu/


# NIMBUS
# First install the conda environment: allInOne_methyldackel from file: allInOne_methyldackelNimbus.yaml
# It was created based on bwameth installation with bwa-meth and bwa-mem removed
# Then install the libbigwig from conda: conda install -c bioconda libbigwig
# Then install the custom methyldackel from:
make install CFLAGS="-O3 -Wall -I/data/apps/miniconda3/envs/allInOne_methyldackel/include " prefix=/data/apps/miniconda3/envs/allInOne_methyldackel/bin LIBS="-L/data/apps/miniconda3/envs/allInOne_methyldackel/lib" LIBBIGWIG="/data/apps/miniconda3/envs/allInOne_methyldackel/lib/libBigWig.a"
