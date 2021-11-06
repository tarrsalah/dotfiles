# Oh My ZSH!
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git docker docker-compose pass)

source $ZSH/oh-my-zsh.sh

# pip3 bin
export PATH="$PATH:$HOME/.local/bin"

# RBENV
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# YARN
export PATH="$PATH:$HOME/.yarn/bin"

# Go
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/local/go/bin"
export GO111MODULE="auto"

# Symfony
export PATH="$HOME/.symfony/bin:$PATH"

# Docker
dkclean () {
    docker stop $(docker ps -qa)
    docker system prune
}

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash


# erlang
export ERL_AFLAGS="-kernel shell_history enabled"


# conda
conda_setup() {
    __conda_setup="$('/home/tarrsalah/pkg/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/tarrsalah/pkg/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/home/tarrsalah/pkg/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/home/tarrsalah/pkg/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
}

stty -ixon
