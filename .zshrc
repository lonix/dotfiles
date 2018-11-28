#!/bin/zsh

#Export for personal Binarys
export PATH=$HOME/.bin:$HOME/go/bin:/usr/local/bin:$PATH
export GPG_TTY=$(tty)
export GOPATH=$HOME/Go:/usr/local/go
export fpath=(~/.zsh/completion $fpath)
export TERM="xterm-256color"

## Add completion for Google Cloud sdk
if [[ $(type gcloud) && $(uname) == "Darwin" ]]; then
	source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
	source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
fi

##Add iterm intigration
if [[ $(uname) == "Darwin" ]]; then
	source ~/.iterm2_shell_integration.$(basename $SHELL)
fi

##Configure default editior for local and SSH sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='code -w '
fi

## Adding Mac alias for updating stuff
# if [[ $(uname) == "Darwin" ]]; then
# 	alias mac-update="brew update && brew upgrade -y && brew cu -y && antibody update && mas upgrade && dotsync -U && dotsync -P && dotsync -A"
# fi

#Initialize antibody pluginloader
source <(antibody init)

## Antigen Modules to always load
antibody bundle <<EOBUNDLE
zsh-users/zsh-autosuggestions
zsh-users/zsh-completions
rupa/z
EOBUNDLE

## Add git spesific modules
if [ $commands[git] ]; then
	antibody bundle <<EOBUNDLE
caarlos0/zsh-git-fetch-merge kind:path
caarlos0/zsh-git-sync kind:path
caarlos0/zsh-open-pr kind:path
EOBUNDLE

fi

if [ $commands[kubectl] ]; then
	source <(kubectl completion zsh)
fi

#These bundles should always be last
antibody bundle <<EOBUNDLE
mafredri/zsh-async
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-history-substring-search
EOBUNDLE

#Reload compinit
autoload -Uz compinit

if [[ $(date +'%j') != $(date -r ~/.zcompdump +%j) ]]; then
		compinit
else
	compinit -C
fi

#Load Bashcompinit
if [ $commands[az] ]; then
	autoload -U +X bashcompinit && bashcompinit
	source /usr/local/etc/bash_completion.d/az
fi




