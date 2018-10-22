#!/bin/zsh

#Export for personal Binarys
export PATH=$HOME/.bin:$HOME/go/bin:/usr/local/bin:$PATH
export GPG_TTY=$(tty)
export GOPATH=$HOME/Go:/usr/local/go
export fpath=(~/.zsh/completion $fpath)


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
if [[ $(uname) == "Darwin" ]]; then
	alias mac-update="brew update && brew upgrade -y && brew cu -y && antibody update && mas upgrade && dotsync -U && dotsync -P && dotsync -A"
fi

#Initialize antibody pluginloader
source <(antibody init)

## Define mode/font for Powerlevel 9k
POWERLEVEL9K_MODE='nerdfont-complete'

## Antigen Modules to always load
#antigen use oh-my-zsh
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


## Apply theme for antibody
antibody bundle bhilburn/powerlevel9k

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

#######Powerlevel 9000

## POWERLEVEL9K PROMT SETTINGS ##
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{cyan}\u256D\u2500%f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{cyan}\u2570\uF460\uF460 λ "
OWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_unique"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon status dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time background_jobs battery time ssh context_joined)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

## MISC ##
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true

###### LEFT SIDE ######
## OS Icon
POWERLEVEL9K_OS_ICON_BACKGROUND="black"
POWERLEVEL9K_OS_ICON_FOREGROUND="cyan"

## Status
POWERLEVEL9K_STATUS_OK_BACKGROUND="black"
POWERLEVEL9K_STATUS_OK_FOREGROUND="cyan"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="black"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"

## Kubecontext
POWERLEVEL9K_KUBECONTEXT_FOREGROUND="cyan"
POWERLEVEL9K_KUBECONTEXT_BACKGROUND="black"

## Dir Writable
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="black"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="cyan"

## Dir
POWERLEVEL9K_DIR_HOME_BACKGROUND="black"
POWERLEVEL9K_DIR_HOME_FOREGROUND="cyan"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="black"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="cyan"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="black"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="cyan"

## VCS
POWERLEVEL9K_VCS_CLEAN_BACKGROUND="black"
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="cyan"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="black"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="yellow"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="black"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="yellow"
POWERLEVEL9K_VCS_GIT_GITHUB_ICON="\ue709"
POWERLEVEL9K_VCS_GIT_BITBUCKET_ICON="\ue703"
POWERLEVEL9K_VCS_GIT_GITLAB_ICON="\ue705"
POWERLEVEL9K_VCS_GIT_ICON=""

###### RIGHT SIDE

## Command Execution TIme
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="black"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="cyan"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_ICON="\u231A"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD="3"

## Background Jobs
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND="black"
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND="cyan"

##Ssh
#POWERLEVEL9K_SSH_FOREGROUND="226"
POWERLEVEL9K_SSH_FOREGROUND="cyan"
POWERLEVEL9K_SSH_BACKGROUND="black"
POWERLEVEL9K_SSH_ICON="\uF489" #

##Battery
POWERLEVEL9K_BATTERY_CHARGING="cyan"
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND="yellow"
POWERLEVEL9K_BATTERY_CHARGED="cyan"
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND="cyan"
POWERLEVEL9K_BATTERY_DISCONNECTED="cyan"
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND="cyan"
POWERLEVEL9K_BATTERY_LOW_THRESHOLD="15"
POWERLEVEL9K_BATTERY_LOW_COLOR="red"
POWERLEVEL9K_BATTERY_VERBOSE="flase"

##Time
POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %T}"
POWERLEVEL9K_TIME_FOREGROUND="cyan"
POWERLEVEL9K_TIME_BACKGROUND="black"

##Context
DEFAULT_USER=lonix
POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=false #Always show this segment, including $USER and hostname.
POWERLEVEL9K_ALWAYS_SHOW_USER=false    #Always show the username, but conditionalize the hostname.
POWERLEVEL9K_CONTEXT_TEMPLATE="%n@%m"
POWERLEVEL9K_CONTEXT_BACKGROUND="black"
POWERLEVEL9K_CONTEXT_FOREGROUND="cyan"
