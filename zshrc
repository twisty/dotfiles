HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

TZ="Europe/London"

EDITOR="/usr/bin/vim"

LC_CTYPE=en_US.UTF-8

# oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="twisty"
plugins=(git osx vi-mode history-substring-search zsh-completions)
source $ZSH/oh-my-zsh.sh

autoload -Uz compinit
compinit

d=.dircolors
test -r $d && eval "$(dircolors $d)"

##
# use 'dirs' to see the stack of past directories
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

source $HOME/.bash_aliases
