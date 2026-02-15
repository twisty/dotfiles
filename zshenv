path=(/usr/bin /bin /usr/sbin /sbin)
path=(/usr/local/bin /usr/local/sbin $path)
if [[ -d "/home/linuxbrew/.linuxbrew" ]] ; then
  path=(/home/linuxbrew/.linuxbrew/bin /home/linuxbrew/.linuxbrew/sbin $path)
fi
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
# Python
#
export PYTHON=/usr/local/bin/python3

##
# NVM
#
# Setup nvm here, in zshenv, so it works with vim.
# - https://github.com/creationix/nvm/issues/240#issuecomment-18800769
#
# Be sure that there is a 'default' version in nvm:
#     nvm alias default node
#
# Note for mac: the next config file loaded (/etc/zprofile) has a call to
# `/usr/libexec/path_helper -s` which jams /usr/local/bin at the start of the
# path. So, if you also have node installed via brew, this nvm initialization
# wont work. This is fixed by calling `nvm use default` in .zshrc.
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

##
# Volta
#
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
