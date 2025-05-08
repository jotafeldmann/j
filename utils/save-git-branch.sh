#!/bin/bash

# Usage examples:
# ./save-git-branch.sh j/temp/save-git-branch.txt
# ./save-git-branch.sh j/temp/save-git-branch.txt save

SAVE_PATH_FILE=$1
OPTION=$2

if [ "$OPTION" = "save" ]; then
  git rev-parse --abbrev-ref HEAD > $SAVE_PATH_FILE

elif [ "$OPTION" = "create" ]; then
  touch $SAVE_PATH_FILE

elif [ "$OPTION" = "last" ]; then
  cat $SAVE_PATH_FILE

elif [ "$OPTION" = "config" ]; then
  echo $SAVE_PATH_FILE

else
  git checkout $(cat $SAVE_PATH_FILE)
fi
