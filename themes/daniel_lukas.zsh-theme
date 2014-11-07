local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"

user_color=""

lspci | grep -i " virtio " > /dev/null
if [[ $? == 0 ]]; then
        user_color="%{$bg_bold[green]%}"
fi

if [[ "x${USER}x" = "xrootx" ]]; then
        user_color="%{$bg_bold[red]%}"
fi

if [[ "x${DL_ZSH_GIT_PROMPT}x" == "xtruex" ]]; then
        PROMPT='${user_color}[%n@%u%m%u]%{$reset_color%} %{$fg_bold[black]%}%p %{$fg[blue]%}%~%{$fg[grey]%}$(hg_prompt_info)$(git_prompt_info) %{$fg_bold[red]%}➜ %{$reset_color%}'
else
        PROMPT='${user_color}[%n@%u%m%u]%{$reset_color%} %{$fg_bold[blue]%}%p %{$g[blue]%}%~%{$fg[grey]%} %{$fg_bold[red]%}${ret_status} %{$reset_color%}'
fi

export LSCOLORS=""
export LS_COLORS

