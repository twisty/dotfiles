##
# prompt
#
#function prompt_char {
#    git branch >/dev/null 2>/dev/null && echo '±' && return
#    echo '○'
#}
#setopt PROMPT_SUBST
local ret_status="%(?:%{$fg_bold[green]%}► :%{$fg_bold[red]%}► %s)"
NEWLINE=$'\n'
PROMPT='%{$reset_color%}%{$fg[green]%}%T %{$fg[cyan]%}%m %{$fg[yellow]%}%3~ $(git_prompt_info)${NEWLINE}${ret_status}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}±(%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[cyan]%}) %{$fg[red]%}‼ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[cyan]%}) "
