# ZSH Git Prompt Plugin from:
# http://github.com/olivierverdier/zsh-git-prompt
#

export __GIT_PROMPT_DIR=$ZSH/plugins/git-prompt

## Enable auto-execution of functions.

typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions

# Append git functions needed for prompt.

preexec_functions+='preexec_update_git_vars'
precmd_functions+='precmd_update_git_vars'
chpwd_functions+='chpwd_update_git_vars'

## Function definitions

preexec_update_git_vars()
{
  case "$2" in
    git*)
      __EXECUTED_GIT_COMMAND=1
    ;;
  esac
}

precmd_update_git_vars()
{
  if [ -n "$__EXECUTED_GIT_COMMAND" ]; then
    update_current_git_vars
    unset __EXECUTED_GIT_COMMAND
  fi
}

chpwd_update_git_vars()
{
  update_current_git_vars
}

update_current_git_vars()
{
  unset __CURRENT_GIT_STATUS

  local gitstatus="$__GIT_PROMPT_DIR/gitstatus.py"
  _GIT_STATUS=`python ${gitstatus}`
  __CURRENT_GIT_STATUS=("${(f)_GIT_STATUS}")
}

prompt_git_info()
{
  if [ -n "$__CURRENT_GIT_STATUS" ]; then
    echo "(%{${fg[red]}%}$__CURRENT_GIT_STATUS[1]%{${fg[default]}%}$__CURRENT_GIT_STATUS[2]%{${fg[magenta]}%}$__CURRENT_GIT_STATUS[3]%{${fg[default]}%})"
  fi
}

# Set the prompt.
#PROMPT='%B%m%~%b$(prompt_git_info) %# '
# for a right prompt:
#RPROMPT='%b$(prompt_git_info)'
RPROMPT='$(prompt_git_info)'

