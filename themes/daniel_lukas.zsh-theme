ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[white]%}git:(%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%}*%{$fg_bold[white]%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[white]%})"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[blue]%}?"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[blue]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%}~"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}d"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}r"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%}U"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[white]%}(+)"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg_bold[white]%}(-)"
ZSH_THEME_GIT_PROMPT_DIVERGED="%{$fg[yellow]%}D"
#ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX="(+"
#ZSH_THEME_GIT_COMMITS_AHEAD_SUFFIX=")"

if [[ $TWO_LINE_PROMPT == yes ]]; then
        local NEWLINE=$'\n'
        local ret_status="%(?:%{$fg_bold[green]%}${NEWLINE}→ :%{$fg_bold[red]%}${NEWLINE}→ %s)"
else
        local ret_status="%(?:%{$fg_bold[green]%}→ :%{$fg_bold[red]%}→ %s)"
fi

user_color=""

which lspci > /dev/null && lspci | grep -i " virtio " > /dev/null
if [[ $? == 0 ]]; then
        user_color="%{$bg_bold[green]%}"
fi

if [[ "x${USER}x" = "xrootx" ]]; then
        user_color="%{$bg_bold[red]%}"
fi

DL_ZSH_PROMPT_TIME='%*'
PROMPT_PREFIX="${DL_ZSH_PROMPT_TIME} ${PROMPT_PREFIX}"
if [[ "x${DL_ZSH_GIT_PROMPT}x" == "xtruex" ]]; then
        PROMPT='${user_color}[${PROMPT_PREFIX}%n@%u%m%u]%{$reset_color%}%{$fg_bold[black]%}%p %{$fg[blue]%}%~%{$fg[white]%} $(git_prompt_info)$(git_prompt_status) ${ret_status} %{$reset_color%}'
else
        PROMPT='${user_color}[${PROMPT_PREFIX}%n@%u%m%u]%{$reset_color%}%{$fg_bold[blue]%}%p %{$fg[blue]%}%~%{$fg[grey]%} ${ret_status} %{$reset_color%}'
fi

export LSCOLORS=""
export LS_COLORS

