# Oh My ZSH!
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git nvm docker docker-compose)
source $ZSH/oh-my-zsh.sh

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


# Compose
export COMPOSER="$HOME/.config/composer"
export PATH="$PATH:$COMPOSER/vendor/bin"
