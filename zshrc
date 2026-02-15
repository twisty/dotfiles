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

