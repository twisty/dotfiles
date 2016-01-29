# "Command exists" pattern:
#     http://www.zsh.org/mla/users/2011/msg00070.html

path=(/usr/bin /bin /usr/sbin /sbin)
path=(/usr/local/bin /usr/local/sbin $path)

# Macports
if [[ -a /opt/local/bin/port ]] ; then
  path=(/opt/local/bin /opt/local/sbin $path)
fi

# Macports apache
if [[ -a /opt/local/apache2/bin/httpd ]] ; then
  path=(/opt/local/apache2/bin $path)
fi

# Global node modules.
if (( $+commands[npm] )) ; then
  path=(~/local/node/bin $path)
fi

# Composer
if (( $+commands[composer] )) ; then
  path=(~/.composer/vendor/bin $path)
fi

path=(~/local/bin $path)
path=(~/Applications $path)

# If brew is installed, try and set the correct PHP path
# if (( $+commands[brew] )) ; then
#   path="$(brew --prefix php54)/bin:$path"
# fi

# Setup nvm here, in zshenv, so it works with vim.
# - https://github.com/creationix/nvm/issues/240#issuecomment-18800769
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
