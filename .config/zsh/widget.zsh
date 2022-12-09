function _fzf_history() {
    local tac=${commands[tac]:-"tail -r"}
    BUFFER=$( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | sed 's/ *[0-9]* *//' | eval $tac | awk '!a[$0]++' | fzf-tmux +s -p 80%,70%)
    CURSOR=$#BUFFER
}
zle     -N   _fzf_history
bindkey '^R' _fzf_history

function _fzf_ghq() {
  local selected_dir=$(ghq list | fzf-tmux --query="$LBUFFER" -p 80%,70% )
  if [ -n "$selected_dir" ]; then
    if [ -e $(ghq root)/${selected_dir} ]; then
      BUFFER="cd $(ghq root)/${selected_dir}"
    else
      BUFFER="cd $GOPATH/src/${selected_dir}"
    fi
    zle accept-line
  fi
  zle reset-prompt
}
zle -N _fzf_ghq
bindkey "^G" _fzf_ghq
