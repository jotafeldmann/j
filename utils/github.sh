#!/bin/bash

# Usage examples:
# ./github.sh j/utils/github.sh j/temp/save_path.txt last
# ./github.sh j/utils/github.sh j/temp/save_path.txt save

THIS_FILE_PATH=$1
MY_TEMP_FILE=$2
COMMAND=$3
OPTION=$4

if [ "$COMMAND" = "create" ]; then
  touch $MY_TEMP_FILE

elif [ "$COMMAND" = "save" ]; then
  git rev-parse --abbrev-ref HEAD > $MY_TEMP_FILE

elif [ "$COMMAND" = "back" ]; then
  git checkout $(cat $MY_TEMP_FILE)

elif [ "$COMMAND" = "last" ]; then
  cat $MY_TEMP_FILE

elif [ "$COMMAND" = "where" ]; then
  echo $MY_TEMP_FILE

elif [ "$COMMAND" = "a" ]; then
  git add .

elif [ "$COMMAND" = "ac" ]; then
  git add . && git commit -m "$OPTION"

elif [ "$COMMAND" = "b" ]; then
  git branch

elif [ "$COMMAND" = "c" ]; then
  git commit -m "$OPTION"

elif [ "$COMMAND" = "cane" ]; then
  git commit --amend --no-edit

elif [ "$COMMAND" = "ch" ]; then
  git checkout $OPTION

elif [ "$COMMAND" = "d" ]; then
  git diff

elif [ "$COMMAND" = "f" ]; then
  git add . && git commit --amend --no-edit && git push -f

elif [ "$COMMAND" = "m" ]; then
  git checkout main
  git checkout master
  git pull

elif [ "$COMMAND" = "p" ]; then
  git pull $OPTION

elif [ "$COMMAND" = "ps" ]; then
  git push $OPTION

elif [ "$COMMAND" = "rh" ]; then
  git reset --hard

elif [ "$COMMAND" = "s" ]; then
  git status

else
  cat $THIS_FILE_PATH
fi
