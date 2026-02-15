HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

TZ="Europe/London"

EDITOR="/usr/bin/vim"

LC_CTYPE=en_US.UTF-8

##
# Add `brew` completion.
# - https://docs.brew.sh/Shell-Completion
#
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

##
# `oh-my-zsh` configuration.
#
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="twisty"
plugins=(
  git
  git-flow
  history-substring-search
  npm
  macos
  vi-mode
  yarn
  zsh-completions
)
source $ZSH/oh-my-zsh.sh

export BAT_THEME="gruvbox-dark"

if (( $+commands[dircolors] )) ; then
    d=.dircolors
    test -r $d && eval "$(dircolors $d)"
fi

##
# use `dirs` to see the stack of past directories
# use cd ~n to access stack
#
setopt auto_pushd

##
# Use known_hosts for hostname completion.
#
if [ -f ~/.ssh/known_hosts ] ; then
    zstyle ':completion:*' hosts $( sed 's/[, ].*$//' $HOME/.ssh/known_hosts )
    zstyle ':completion:*:*:(ssh|scp):*:*' hosts `sed 's/^\([^ ,]*\).*$/\1/' ~/.ssh/known_hosts`
fi

##
# Aliases
#
[ -f ~/.bash_aliases ] && source ~/.bash_aliases

##
# Aliases: WSL specific…
#
if [[ -d "/mnt/c/Windows" ]] ; then
    alias code='/mnt/c/Users/tim/AppData/Local/Programs/Microsoft\ VS\ Code/bin/code'
fi

##
# Fuzzy finder
# - https://github.com/junegunn/fzf
#
export FZF_DEFAULT_OPTS="--preview 'head -100 {}'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

###
## Re-init nvm
##
#[ -d ~/.nvm ] && nvm use default

##
# Azure CLI
#
source $(brew --prefix)/etc/bash_completion.d/az

##
# Switch php
# - https://dcblog.dev/switching-between-php-versions-with-homebrew
#
switchphp() {
  VERSION="${1:-latest}"

  if [ "$VERSION" = "latest" ]
  then
    # set php to latest
    brew unlink php && brew link --force --overwrite php
  else
    # set php to version specified
    brew unlink php && brew link --force --overwrite php@$1
  fi
}

umask 002

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
