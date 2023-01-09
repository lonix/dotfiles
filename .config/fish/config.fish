if status is-interactive
    export EDITOR='code -w '
else
    export EDITOR='vim'
end

fish_add_path -p ~/.bin
fish_add_path /usr/local/sbin
starship init fish | source

if type -q infracost 
	infracost completion --shell fish | source
end
