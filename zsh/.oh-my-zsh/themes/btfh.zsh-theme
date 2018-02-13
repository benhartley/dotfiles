# AWS ACCOUNT NAME - nicked from here: https://github.com/coinbase/assume-role
function aws_account_info {
  [ "${ASSUMED_ROLE}" ] && echo "%F{blue}aws:(%f%F{red}${ASSUMED_ROLE}%f%F{blue})%F$reset_color "
}

PROMPT='%(!.%{$fg[green]%}%n@%m.%{$fg[blue]%}%n@%m) %{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
PROMPT=$(echo "$(aws_account_info)${PROMPT}")

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"
