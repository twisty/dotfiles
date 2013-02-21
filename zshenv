path=(/usr/bin /bin /usr/sbin /sbin)
path=(/usr/local/bin /usr/local/sbin $path)
path=(~/local/node/bin $path)
path=(~/local/bin $path)
path=(~/Applications $path)

PATH="$(brew --prefix php54)/bin:$PATH"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
