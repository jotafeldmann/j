#!/bin/bash

# Usage examples:
# ./save-path.sh j/temp/save_path.txt save
# ./save-path.sh j/temp/save_path.txt last

SAVE_PATH_FILE=$1
OPTION=$2

if [ "$OPTION" = "save" ]; then
  echo $PWD > $SAVE_PATH_FILE

elif [ "$OPTION" = "create" ]; then
  touch $SAVE_PATH_FILE

elif [ "$OPTION" = "last" ]; then
  cat $SAVE_PATH_FILE

elif [ "$OPTION" = "config" ]; then
  echo $SAVE_PATH_FILE

else
  cd $(cat $SAVE_PATH_FILE)
fi
