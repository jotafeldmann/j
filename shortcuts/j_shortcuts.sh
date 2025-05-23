#!/bin/bash

# Usage examples:
# . j_shortcuts.sh help

THIS_FILE_PATH=$1
OPTION=$2

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

# reload
elif [ "$OPTION" = "r" ]; then
    jr && echo "Reloaded SHELL"

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

# where
elif [ "$OPTION" = "where" ]; then
  echo $J_PATH

else
  cat $THIS_FILE_PATH
fi
