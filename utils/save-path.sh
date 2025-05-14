#!/bin/bash

# Usage examples:
# ./save-path.sh j/temp/save_path.txt save
# ./save-path.sh j/temp/save_path.txt last

THIS_FILE_PATH=$1
SAVE_PATH_FILE=$2
OPTION=$3

if [ "$OPTION" = "save" ]; then
  echo $PWD > $SAVE_PATH_FILE

elif [ "$OPTION" = "create" ]; then
  touch $SAVE_PATH_FILE

elif [ "$OPTION" = "last" ]; then
  cat $SAVE_PATH_FILE

elif [ "$OPTION" = "config" ]; then
  echo $SAVE_PATH_FILE

elif [ "$OPTION" = "help" ]; then
  cat $THIS_FILE_PATH

else
  cd $(cat $SAVE_PATH_FILE)
fi
