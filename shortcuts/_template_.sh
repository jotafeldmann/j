#!/bin/bash

# Usage examples:
# . _template_.sh j/temp/_template_.txt last
# . _template_.sh j/temp/_template_.txt help

THIS_FILE_PATH=$1
SAVE_PATH_FILE=$2
OPTION=$3

if [ "$OPTION" = "create" ]; then
  touch $SAVE_PATH_FILE

elif [ "$OPTION" = "last" ]; then
  cat $SAVE_PATH_FILE

elif [ "$OPTION" = "where" ]; then
  echo $SAVE_PATH_FILE

elif [ "$OPTION" = "help" ]; then
  cat $THIS_FILE_PATH

# Add commands here

else
  cat $THIS_FILE_PATH
fi
