export MANPATH=$MANPATH:/usr/local/share/man:/opt/local/share/man;
export INFOPATH=$INFOPATH:/opt/local/share/info;
export NODE_PATH=$HOME/local/node:$HOME/local/node/lib/node_modules

export HISTSIZE=200
export HISTFILE=~/.zsh_history
export SAVEHIST=200

export EDITOR=nano
export SVN_EDITOR=nano
export VIM_APP_DIR=/Applications/MacVim

export LC_CTYPE=en_US.UTF-8

##
# http://www.techrepublic.com/blog/opensource/using-vi-key-bindings-in-bash-and-zsh/193
#
bindkey -v

##
# use 'dirs' to see the stack of past directories
# use cd ~n to access stack
#
setopt auto_pushd

##
# colours
#
fg_green=$'%{\e[0;32m%}'
fg_blue=$'%{\e[0;34m%}'
fg_cyan=$'%{\e[0;36m%}'
fg_red=$'%{\e[0;31m%}'
fg_brown=$'%{\e[0;33m%}'
fg_purple=$'%{\e[0;35m%}'
fg_yellow=$'%{\e[0;33m%}'

fg_light_gray=$'%{\e[0;37m%}'
fg_dark_gray=$'%{\e[1;30m%}'
fg_light_blue=$'%{\e[1;34m%}'
fg_light_green=$'%{\e[1;32m%}'
fg_light_cyan=$'%{\e[1;36m%}'
fg_light_red=$'%{\e[1;31m%}'
fg_light_purple=$'%{\e[1;35m%}'
fg_no_colour=$'%{\e[0m%}'

fg_white=$'%{\e[1;37m%}'
fg_black=$'%{\e[0;30m%}'

##
# prompt
#
PS1="${fg_green}%T ${fg_cyan}%m ${fg_yellow}%3~ ${fg_cyan}% %# ${fg_no_colour}"

##
# aliases
#
alias ll='ls -laG'
alias '..'='cd ..'
alias svnst='svn status --ignore-externals'
alias fsize='du -hc -d 0'
alias download='wget \
--wait=2 \
--random-wait \
--html-extension \
--recursive \
--level=1 \
--page-requisites \
--convert-links \
--backup-converted'

##
# Subversion colour diff
#
function svncdiff () {
    svn diff $@ | colordiff | less -R;
}

export GREP_COLOR='30;42'
alias grep='grep --color'

##
# Standard completions
#
autoload -U compinit
compinit

##
# Complete ssh known hosts (from http://gentoo-wiki.com/TIP_Advanced_zsh_Completion)
#
local _myhosts
_myhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
zstyle ':completion:*' hosts $_myhosts

##
# today
#
cat /usr/share/calendar/calendar* | grep ^`date +"%m/%d"`

##
# Color ls.
# http://creativebits.org/enable_ls_colors_in_tiger
#
#       a   black
#       b   red
#       c   green
#       d   brown
#       e   blue
#       f   magenta
#       g   cyan
#       h   light grey
#       A   bold black, usually shows up as dark grey
#       B   bold red
#       C   bold green
#       D   bold brown, usually shows up as yellow
#       E   bold blue
#       F   bold magenta
#       G   bold cyan
#       H   bold light grey; looks like bright white
#       x   default foreground or background
# 
# Note that the above are standard ANSI colors.  The actual
# display may differ depending on the color capabilities of
# the terminal in use.
# 
# The order of the attributes are as follows:
# 
#       1.  directory
#       2.  symbolic link
#       3.  socket
#       4.  pipe
#       5.  executable
#       6.  block special
#       7.  character special
#       8.  executable with setuid bit set
#       9.  executable with setgid bit set
#       10. directory writable to others, with sticky bit
#       11. directory writable to others, without sticky
#           bit

export CLICOLOR=1;
export LSCOLORS=gxcxfxexdxxxxxxxxxxxxx;
