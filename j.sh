#!/bin/bash

# usage
# add to ~/.bashrc
# add these lines to the end of the file

# source ~/workspace/config/j/j.sh \
# ~/workspace/config/j \
# ~/.bashrc \
# ~/workspace/config/local/local.sh \
# ~/workspace/config/local \
# ~/workspace/config/temp \
# ~/workspace

# Parameters for source
export J_PATH=$1
export J_CURRENT_SHELL_FILE=$2
export J_LOCAL=$3
export J_LOCAL_PATH=$4
export J_TEMP_DIR=$5
export J_WORKSPACE=$6

# Configs
export J_SH_MAIN_FILE=$J_PATH/j.sh
export J_CONFIG=$J_PATH/config
export J_SHORTCUTS=$J_PATH/shortcuts
export J_UTILS=$J_PATH/utils

# Init
source $J_CONFIG/_init_.sh
source $J_SHORTCUTS/_init_.sh
source $J_LOCAL
