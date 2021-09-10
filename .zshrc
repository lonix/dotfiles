#!/bin/zsh



##Configure default editior for local and SSH sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code -w '
fi


zsh-users/zsh-history-substring-search



