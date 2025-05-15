#!/bin/bash

# Usage examples:
# . context.sh j/utils/context.sh j/temp/context.sh save "echo 123"
# . context.sh j/utils/context.sh j/temp/context.sh last
# . context.sh j/utils/context.sh j/temp/context.sh

THIS_FILE_PATH=$1
MY_TEMP_FILE=$2
COMMAND=$3
OPTION=$4


if [ "$COMMAND" = "create" ]; then
  touch $MY_TEMP_FILE

elif [ "$COMMAND" = "save" ]; then
  echo $OPTION > $MY_TEMP_FILE

elif [ "$COMMAND" = "last" ]; then
  cat $MY_TEMP_FILE

elif [ "$COMMAND" = "where" ]; then
  echo $MY_TEMP_FILE

elif [ "$COMMAND" = "help" ]; then
  cat $THIS_FILE_PATH

else
  source $MY_TEMP_FILE
fi
