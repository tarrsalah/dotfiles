# Oh My ZSH!
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git nvm docker docker-compose pass)
source $ZSH/oh-my-zsh.sh

# pip3 bin
export PATH="$PATH:$HOME/.local/bin"

# NVM
export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# RBENV 
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# YARN
export PATH="$PATH:$HOME/.yarn/bin"

# Go
export GOPATH=$HOME
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/local/go/bin"
export GO111MODULE="on"

# Symfony
export PATH="$HOME/.symfony/bin:$PATH"

# Docker
dkclean () {
    docker stop $(docker ps -qa)
    docker system prune
}
