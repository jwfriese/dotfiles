# Allow brew to be found in path
eval "$(/opt/homebrew/bin/brew shellenv)"

# the alias section
alias ll='ls -sail'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cpwd='pwd | pbcopy'
alias gti='git'
alias claer='clear'
alias clera='clear'

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
eval `keychain --eval --agents ssh --inherit any <ssh-file-name>`

