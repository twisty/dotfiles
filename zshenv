path=(/usr/bin /bin /usr/sbin /sbin)
path=(/usr/local/bin /usr/local/sbin $path)
path=(/opt/local/bin /opt/local/sbin $path)
path=(~/local/node/bin $path)
path=(~/local/bin $path)
path=(~/Applications $path)

# If brew is installed, try and set the correct PHP path
# http://www.zsh.org/mla/users/2011/msg00070.html
if (( $+commands[brew] )) ; then
    PATH="$(brew --prefix php54)/bin:$PATH"
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
