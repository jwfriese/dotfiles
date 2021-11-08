export GOPATH=$HOME/workspace/go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:/usr/local/bin:/usr/local/go/bin:/usr/local/Cellar/bin:$PATH
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

# Allow brew to be found in path
eval "$(/opt/homebrew/bin/brew shellenv)"
# If not on Apple silicon, this should be this instead
# eval "$(/usr/local/bin/brew shellenv)"

alias ll='ls -sail'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cpwd='pwd | pbcopy'
alias gti='git'
alias claer='clear'
alias clera='clear'
alias startpg='pg_ctl -D /usr/local/var/postgres start'

# bash completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# allow installation of gems without sudo
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

# ensure that gems installed with '--user-install' can be executed easily
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi


# Increase the number of files the shell allows you to have open
ulimit -S -n 1024

# Turn on Homebrew autocomplete
if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi

# Keychain setup so that ssh agent is shared across all terminal sessions
eval `keychain --eval --agents ssh --inherit any github`

# git command line prompt goodness
parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* (*\([^)]*\))*/\1/'
}

markup_git_branch() {
  if [[ -n $@ ]]; then
    if [[ -z $(git status --porcelain 2> /dev/null) ]]; then
      echo -e " \001\033[32m\002($@)\001\033[0m\002"
    else
      echo -e " \001\033[31m\002($@)\001\033[0m\002"
    fi
  fi
}

export PS1="\h:\W\$(markup_git_branch \$(parse_git_branch)) \u$ "

# Yarn global installs
export PATH="$PATH:$(yarn global bin)"

# Rust setup
export PATH="$HOME/.cargo/bin:$PATH"
. "$HOME/.cargo/env"
