#!/bin/bash

# Usage examples:
# ./j_utils.sh help

THIS_FILE_PATH=$1
OPTION=$2

alias c='clear'

if [ "$OPTION" = "help" ]; then
  cat $THIS_FILE_PATH

# clear
elif [ "$OPTION" = "c" ]; then
  c

# edit J
elif [ "$OPTION" = "e" ]; then
  code $J_SH_MAIN_FILE

# edit current shell
elif [ "$OPTION" = "es" ]; then
  code $J_CURRENT_SHELL_FILE

# go to j
elif [ "$OPTION" = "j" ]; then
  cd $J_PATH

# init
elif [ "$OPTION" = "init" ]; then
    mkdir $J_TEMP_DIR
    mkdir $J_LOCAL_PATH;
    touch $J_LOCAL;

# reload
elif [ "$OPTION" = "r" ]; then
    source $J_CURRENT_SHELL_FILE && echo "Reloaded SHELL"

# workspace
elif [ "$OPTION" = "w" ]; then
  cd $J_WORKSPACE

# utils
elif [ "$OPTION" = "u" ]; then
  cd $J_UTILS && ls $J_UTILS

# update
elif [ "$OPTION" = "update" ]; then
    LAST=$pwd;
    cd $J_PATH;
    git pull;
    cd $LAST

else
  cat $THIS_FILE_PATH
fi