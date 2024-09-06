if [ -f ~/.bash_profile ]; then
    source ~/.bash_profile
fi

eval "$(starship init zsh)"

alias ls='lsd'
alias ll='ls -l'
alias la='ls -la'
