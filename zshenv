# "Command exists" pattern:
#     http://www.zsh.org/mla/users/2011/msg00070.html

path=(/usr/bin /bin /usr/sbin /sbin)
path=(/usr/local/bin /usr/local/sbin $path)

# Macports
if [[ -a /opt/local/bin/port ]] ; then
  path=(/opt/local/bin /opt/local/sbin $path)
fi

path=(~/local/bin $path)
path=(~/Applications $path)

# If brew is installed, try and set the correct PHP path
# if (( $+commands[brew] )) ; then
#   path="$(brew --prefix php54)/bin:$path"
# fi

# Setup nvm here, in zshenv, so it works with vim.
# - https://github.com/creationix/nvm/issues/240#issuecomment-18800769
# Be sure that there is a 'default' version in nvm:
#     nvm alias default node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
