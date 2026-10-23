# Interactive shells only
[[ $- == *i* ]] || return

# History
HISTSIZE=5000
HISTFILESIZE=10000
HISTCONTROL=ignoreboth
shopt -s histappend
export PROMPT_COMMAND='history -a; history -n'

# Prompt
parse_git_branch() {
    git branch --show-current 2>/dev/null | sed 's/^/ (/;s/$/)/'
}

PS1='\u:\[\e[1m\]\w\[\e[0m\]$(parse_git_branch)\nλ '

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# PATH
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/bin:$HOME/local/go/bin:${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# Bash completion
if [[ -r /usr/share/bash-completion/bash_completion ]]; then
    . /usr/share/bash-completion/bash_completion
elif [[ -r /etc/bash_completion ]]; then
    . /etc/bash_completion
fi

# Personal aliases
[[ -f "$HOME/.bash_aliases" ]] && . "$HOME/.bash_aliases"

