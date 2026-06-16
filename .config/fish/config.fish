if status is-interactive
    if type -q code
        set -gx EDITOR 'code -w'
    else
        set -gx EDITOR 'vim'
    end
else
    set -gx EDITOR 'vim'
end

#GPG Hack
set -gx GPG_TTY (tty)

# Common paths
fish_add_path -p ~/.bin
fish_add_path -p ~/go/bin
fish_add_path -p ~/.local/bin

# OS-specific paths
if test (uname) = Darwin
    fish_add_path /opt/homebrew/bin
    fish_add_path /opt/homebrew/sbin
    fish_add_path /usr/local/sbin
else if test (uname) = Linux
    fish_add_path /usr/local/sbin
    fish_add_path /usr/local/bin
end

# starship init
if type -q starship
    starship init fish | source
end

# Simple aliases
alias sl="ls"

# Tailscale completion
if type -q tailscale
    tailscale completion fish | source
end

# Infracost completion
if type -q infracost
    infracost completion --shell fish | source
end

# iTerm2 shell integration (macOS only, no-op if file absent)
test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish

# Include local config
test -e ~/.config/fish/config.local.fish; and source ~/.config/fish/config.local.fish

# Set up .bin completions
if test -d $HOME/.bin/completions/fish
    set -a fish_complete_path $HOME/.bin/completions/fish
    for file in $HOME/.bin/completions/fish/*.fish
        source $file
    end
end

# Docker features (cross-platform)
if type -q docker
    function ensure_docker_completions_dir
        if not test -d $HOME/.bin/completions/fish
            mkdir -p $HOME/.bin/completions/fish
        end
    end

    function refresh_docker_completions
        ensure_docker_completions_dir
        docker images --format '{{.Repository}}:{{.Tag}}' >$HOME/.bin/completions/fish/docker_images.cache
        docker ps --format '{{.Names}}' >$HOME/.bin/completions/fish/docker_containers.cache
    end

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
end
