if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    fortune
end

alias j="zellij"
alias vim="env TERM=wezterm nvim"
alias l="eza"
alias cat="bat"

zoxide init fish | source

# pnpm
set -gx PNPM_HOME /Users/peter/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
