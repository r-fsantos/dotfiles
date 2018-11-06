local ret_status="%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%}!! %s)"

function get_pwd(){
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%~
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi
  echo $prompt_short_dir
}

function get_venv() {
  if [[ $VIRTUAL_ENV != "" ]]; then
    echo "($(basename $VIRTUAL_ENV)) "
  else
    echo ""
  fi
}

PROMPT='$ret_status%{$reset_color%}$(get_venv)%{$FG[033]%}$(get_pwd) $(git_prompt_info)%{$reset_color%}%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[037]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$FG[166]%}Δ%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$FG[166]%}λ%{$reset_color%}"
