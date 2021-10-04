if status is-interactive
    export EDITOR='code -w '
else
    export EDITOR='vim'
end

fish_add_path -p ~/.bin

starship init fish | source

