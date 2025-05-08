#!/bin/bash

# Usage examples:
# ./github.sh j/utils/github.sh j/temp/save_path.txt last
# ./github.sh j/utils/github.sh j/temp/save_path.txt save

THIS_FILE_PATH=$1
MY_TEMP_FILE=$2
COMMAND=$3
OPTION=$4

if [ "$COMMAND" = "save" ]; then
  git rev-parse --abbrev-ref HEAD > $MY_TEMP_FILE

elif [ "$COMMAND" = "back" ]; then
  git checkout $(cat $MY_TEMP_FILE)

elif [ "$COMMAND" = "l" ]; then
  cat $MY_TEMP_FILE

elif [ "$COMMAND" = "n" ]; then
  git checkout main
  git checkout master
  git pull

elif [ "$COMMAND" = "c" ]; then
  git checkout $OPTION

elif [ "$COMMAND" = "b" ]; then
  git branch

elif [ "$COMMAND" = "a" ]; then
  git add . && git commit -m "$OPTION"

elif [ "$COMMAND" = "ps" ]; then
  git push $OPTION

elif [ "$COMMAND" = "p" ]; then
  git pull $OPTION

elif [ "$COMMAND" = "s" ]; then
  git status

else
  cat $THIS_FILE_PATH
fi
