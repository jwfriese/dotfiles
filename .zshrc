[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(pyenv init -)"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

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
# git clone --depth=1 https://github.com/jwfriese/git-prompt.zsh ~/.zsh/git-prompt.zsh
source ~/.zsh/git-prompt.zsh/git-prompt.zsh

# Useful when overwriting non-standard MacOS implementations of things like sed.
# By the way, you should definitely overwrite sed: `brew install gnu-sed`
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export USE_GNU_SED=true

# Go stuff
export GOPATH="$HOME/workspace/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"

# Rust path
export PATH="$HOME/.cargo/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
