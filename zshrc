#export PATH=$PATH
export MANPATH=$MANPATH:/usr/local/share/man:/opt/local/share/man;
export INFOPATH=$INFOPATH:/opt/local/share/info;

export HISTSIZE=200
export HISTFILE=~/.zsh_history
export SAVEHIST=200

export EDITOR=vim

export LC_CTYPE=en_US.UTF-8

# oh-my-zsh configuration.
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="twisty"
plugins=(git osx vi-mode npm history-substring-search ssh-agent)
source $ZSH/oh-my-zsh.sh

if [[ -a ~/source/tmux/tmux-2.3/tmux ]] ; then
    alias tmux='env TERM=xterm-256color ~/source/tmux/tmux-2.3/tmux'
fi

##
# use 'dirs' to see the stack of past directories
# use cd ~n to access stack
#
setopt auto_pushd

##
# aliases
#
alias ll='ls -laG'
alias '..'='cd ..'
alias fsize='du -hc -d 0'
alias cls='clear'
alias start-ssh-agent='eval "$(ssh-agent -s)";ssh-add'

##
# Use known_hosts for hostname completion.
#
if [ -f ~/.ssh/known_hosts ]; then
    zstyle ':completion:*' hosts $( sed 's/[, ].*$//' $HOME/.ssh/known_hosts )
    zstyle ':completion:*:*:(ssh|scp):*:*' hosts `sed 's/^\([^ ,]*\).*$/\1/' ~/.ssh/known_hosts`
fi

# "Command exists" pattern:
#     http://www.zsh.org/mla/users/2011/msg00070.html

# neovim
if (( $+commands[nvim] )) ; then
    alias vim=nvim
fi

# Composer
if (( $+commands[composer] )) ; then
  path=(~/.composer/vendor/bin $path)
fi

# Docker
if (( $+commands[docker-machine] )) ; then
  eval $(docker-machine env)
fi
