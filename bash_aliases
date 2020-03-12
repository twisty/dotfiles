##
# aliases
#
alias vim=nvim
alias ll='ls -laG'
alias '..'='cd ..'
alias fsize='du -hc -d 0'
alias cls='clear'
alias start-ssh-agent='eval "$(ssh-agent -s)";ssh-add'
alias did="vim +'normal Go' +'r!date' ~/did.txt"

##
# WSL specific
#
if [[ -d "/mnt/c/Windows" ]] ; then
    alias win="/mnt/c/Windows/explorer.exe"
    alias tmux-test="env TERM=xterm-256color tmux"
fi
