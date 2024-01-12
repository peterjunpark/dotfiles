if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    fortune
end


alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias l="eza"
alias cat="bat"

thefuck --alias | source
