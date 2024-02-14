if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    fortune
end

alias j="zellij"
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias l="eza"
alias cat="bat"
alias unity="nvim --listen 127.0.0.1:42069"

zoxide init fish | source

# pnpm
set -gx PNPM_HOME /Users/peter/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
