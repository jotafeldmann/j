#!/bin/bash

export J_UTIL_SAVE_PATH_FILE=$J_TEMP_DIR/save-path.txt
function jsp() {
  . $J_UTILS/save-path.sh $J_UTIL_SAVE_PATH_FILE "$@"
}
alias jsp=jsp

export J_UTIL_GIT=$J_TEMP_DIR/save-git.txt
function g() {
  . $J_UTILS/github.sh $J_UTILS/github.sh $J_UTIL_GIT "$@"
}
alias g=g

export J_UTIL_CONTEXT=$J_TEMP_DIR/context.sh
function context() {
  . $J_UTILS/context.sh $J_UTILS/context.sh $J_UTIL_CONTEXT "$@"
}
alias jc=context
