if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    fortune
end

alias vim="env TERM=wezterm nvim"
alias l="eza"
alias cat="bat"

zoxide init fish | source

pyenv init - | source
