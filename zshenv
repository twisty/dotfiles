path=(/usr/bin /bin /usr/sbin /sbin)
path=(/usr/local/bin /usr/local/sbin $path)
path=(/home/linuxbrew/.linuxbrew/bin /home/linuxbrew/.linuxbrew/sbin $path)
path=(~/.local/bin $path)
path=(~/local/bin $path)
path=(~/Applications $path)

##
# Composer
#
if (( $+commands[composer] )) ; then
  path=(~/.composer/vendor/bin $path)
fi

##
# Yarn
#
if (( $+commands[yarn] )) ; then
  path=($(yarn global bin) $path)
fi

##
# NVM
#
# Setup nvm here, in zshenv, so it works with vim.
# - https://github.com/creationix/nvm/issues/240#issuecomment-18800769
# Be sure that there is a 'default' version in nvm:
#     nvm alias default node
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
