##
# aliases
#
if (( $+commands[nvim] )) ; then
  alias vim=nvim
fi

alias ll='ls -la'
alias '..'='cd ..'
alias fsize='du -hc -d 0'
alias cls='clear'
alias start-ssh-agent='eval "$(ssh-agent -s)";ssh-add'
alias did="vim +'normal Go' +'r!date' ~/did.txt"
alias beer="cd ~/Source/true/staustell/StAustell.Umbraco/wwwroot/Assets/wholesale"
alias teams="cd ~/Source/true/ActiveTeams.UI"

if (( $+commands[bat] )) ; then
    alias cat=bat
fi

if (( $+commands[eza] )) ; then
    alias ls='eza'
fi

##
# WSL specific
#
if [[ -d "/mnt/c/Windows" ]] ; then
    alias win="/mnt/c/Windows/explorer.exe"
    if [[ -a ~/source/tmux/tmux-2.7/tmux ]] ; then
        alias tmux='env TERM=xterm-256color ~/source/tmux/tmux-2.7/tmux'
        alias tmux-test='env TERM=tmux ~/source/tmux/tmux-2.7/tmux'
    fi
    if [[ -d "/mnt/c/Program\ Files/Microsoft\ VS\ Code" ]] ; then
        alias code="/mnt/c/Program\ Files/Microsoft\ VS\ Code/bin/code"
    fi
    alias tmux-test="env TERM=xterm-256color tmux"
fi
