#!/bin/bash

alias c='clear'

alias jr='source $J_CURRENT_SHELL_FILE'

function j() {
  . $J_SHORTCUTS/j_shortcuts.sh $J_SHORTCUTS/j_shortcuts.sh "$@"
}
alias j=j


export J_UTIL_SAVE_PATH_FILE=$J_TEMP_DIR/save-path.txt
function jsp() {
  . $J_SHORTCUTS/save-path.sh $J_SHORTCUTS/save-path.sh $J_UTIL_SAVE_PATH_FILE "$@"
}
alias jsp=jsp

export J_UTIL_GIT=$J_TEMP_DIR/save-git.txt
function g() {
  . $J_SHORTCUTS/github.sh $J_SHORTCUTS/github.sh $J_UTIL_GIT "$@"
}
alias g=g

export J_UTIL_CONTEXT=$J_TEMP_DIR/context.sh
function context() {
  . $J_SHORTCUTS/context.sh $J_SHORTCUTS/context.sh $J_UTIL_CONTEXT "$@"
}
alias jc=context
