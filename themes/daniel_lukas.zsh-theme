local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"

user_color=""

which lspci > /dev/null && lspci | grep -i " virtio " > /dev/null
if [[ $? == 0 ]]; then
        user_color="%{$bg_bold[green]%}"
fi

if [[ "x${USER}x" = "xrootx" ]]; then
        user_color="%{$bg_bold[red]%}"
fi

if [[ "x${DL_ZSH_GIT_PROMPT}x" == "xtruex" ]]; then
        PROMPT='${user_color}[${PROMPT_PREFIX}%n@%u%m%u]%{$reset_color%} %{$fg_bold[black]%}%p %{$fg[blue]%}%~%{$fg[white]%} $(hg_prompt_info)$(git_prompt_info) ${ret_status} %{$reset_color%}'
else
        PROMPT='${user_color}[${PROMPT_PREFIX}%n@%u%m%u]%{$reset_color%} %{$fg_bold[blue]%}%p %{$fg[blue]%}%~%{$fg[grey]%} ${ret_status} %{$reset_color%}'
fi

export LSCOLORS=""
export LS_COLORS

