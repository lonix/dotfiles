if status is-interactive
    export EDITOR='code -w '
else
    export EDITOR='vim'
end

#GPG Hack
set -gx GPG_TTY (tty)

#fish path
fish_add_path -p ~/.bin
fish_add_path -p ~/go/bin
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path /usr/local/sbin
fish_add_path -p ~/.local/bin
#starship init
starship init fish | source

#tailscale completion
if type -q tailscale
    tailscale completion fish | source
end

#Infracost completion
if type -q infracost
    infracost completion --shell fish | source
end

#source iterm2 shell integration if it exists
test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish

#include local config
test -e ~/.config/fish/config.local.fish; and source ~/.config/fish/config.local.fish

# Add the scripts directory to PATH if it's not already there
if not contains $HOME/.bin $PATH
    set -a PATH $HOME/.bin
end

# Set up completions
if test -d $HOME/.bin/completions/fish
    # Add the completions directory to fish's completion path
    set -a fish_complete_path $HOME/.bin/completions/fish

    # Source all completion files
    for file in $HOME/.bin/completions/fish/*.fish
        source $file
    end
end

# Docker completions cache refresh function
function refresh_docker_completions
    # Refresh Docker image completions
    docker images --format '{{.Repository}}:{{.Tag}}' >$HOME/.bin/completions/fish/docker_images.cache
    # Refresh Docker container completions
    docker ps --format '{{.Names}}' >$HOME/.bin/completions/fish/docker_containers.cache
end

# Refresh Docker completions every hour
function __refresh_docker_completions_timer --on-event fish_prompt
    if test -f $HOME/.bin/completions/fish/docker_completions_timestamp
        set timestamp (cat $HOME/.bin/completions/fish/docker_completions_timestamp)
        set current_time (date +%s)
        if test (math $current_time - $timestamp) -gt 3600
            refresh_docker_completions
            echo $current_time >$HOME/.bin/completions/fish/docker_completions_timestamp
        end
    else
        refresh_docker_completions
        date +%s >$HOME/.bin/completions/fish/docker_completions_timestamp
    end
end
