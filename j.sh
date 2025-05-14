#!/bin/bash

COLOR_GIT_CLEAN='\[\033[1;30m\]'
COLOR_GIT_MODIFIED='\[\033[0;33m\]'
COLOR_GIT_STAGED='\[\033[0;36m\]'
COLOR_RESET='\[\033[0m\]'

function git_prompt() {
  if [ -e ".git" ]; then
    branch_name=$(git symbolic-ref -q HEAD)
    branch_name=${branch_name##refs/heads/}
    branch_name=${branch_name:-HEAD}

    echo -n "→ "

    if [[ $(git status 2> /dev/null | tail -n1) = *"nothing to commit"* ]]; then
      echo -n "$COLOR_GIT_CLEAN$branch_name$COLOR_RESET"
    elif [[ $(git status 2> /dev/null | head -n5) = *"Changes to be committed"* ]]; then
      echo -n "$COLOR_GIT_STAGED$branch_name$COLOR_RESET"
    else
      echo -n "$COLOR_GIT_MODIFIED$branch_name*$COLOR_RESET"
    fi

    echo -n " "
  fi
}

# based upon https://gist.github.com/michaelneu/943693f46f7aa249fad2e6841cd918d5
function prompt() {
  PS1="\[\]\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] $(git_prompt)\[\]\n"
}
PROMPT_COMMAND=prompt

export J_PATH=$1
export J_CURRENT_SHELL_FILE=$2
export J_LOCAL=$3
export J_LOCAL_PATH=$4
export J_WORKSPACE=~/code
export J_TEMP_DIR=$J_PATH/temp
export J_UTILS=$J_PATH/utils
export J_SH_MAIN_FILE=$J_PATH/j.sh

alias j='cat $J_SH_MAIN_FILE | grep alias'
alias c='clear'
alias jj='cd $J_PATH/'
alias jre='source $J_SH_MAIN_FILE $J_PATH $J_CURRENT_SHELL_FILE $J_LOCAL $J_LOCAL_PATH'
alias jrb='source $J_CURRENT_SHELL_FILE && echo "Reloaded SHELL"'
alias je='code $J_SH_MAIN_FILE'
alias jwe='cd $J_WORKSPACE'
alias ju='cd $J_UTILS && ls $J_UTILS'

source $J_UTILS/_init_.sh

source $J_LOCAL