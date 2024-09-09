if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish

starship init fish | source

fzf --fish | source

zoxide init fish | source


# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"


# added by Webi for pyenv
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source
