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
fish_add_path /usr/local/sbin

#starship init
starship init fish | source

if type -q infracost
  infracost completion --shell fish | source
end

#source iterm2 shell integration if it exists
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

#include local config
test -e ~/.config/fish/config.local.fish ; and source ~/.config/fish/config.local.fish
