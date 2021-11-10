[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(pyenv init -)"

# Homebrew
eval "$(/usr/local/bin/brew shellenv)"

# Helpful stuff
alias ll='ls -sail'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cpwd='pwd | pbcopy'
alias gti='git'
alias claer='clear'
alias clera='clear'
alias startpg='pg_ctl -D /usr/local/var/postgres start'

# Keychain setup so that ssh agent is shared across all terminal sessions
eval `keychain --eval --agents ssh --inherit any <ssh-file-name>`

# Git prompt (needs to be downloaded to this spot first)
# mkdir -p ~/.zsh
# git clone --depth=1 https://github.com/woefe/git-prompt.zsh ~/.zsh/git-prompt.zsh
source ~/.zsh/git-prompt.zsh/git-prompt.zsh
