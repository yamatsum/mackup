function _fzf_history() {
    local tac=${commands[tac]:-"tail -r"}
    BUFFER=$( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | sed 's/ *[0-9]* *//' | eval $tac | awk '!a[$0]++' | fzf-tmux +s)
    CURSOR=$#BUFFER
}
zle     -N   _fzf_history
bindkey '^R' _fzf_history

function _fzf_ghq() {
  local selected_dir=$(ghq list | fzf-tmux --query="$LBUFFER" )
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

function _fzf_ssh () {
  # local selected_host=$(grep "Host " ~/.ssh/config | grep -v '*' | cut -b 6- | fzf-tmux --query "$LBUFFER" )
  local selected_host="$(command egrep -i '^Host\s+.+' $HOME/.ssh/config $(find $HOME/.ssh/conf.d -type f 2>/dev/null) | command egrep -v '[*?]' | awk '{print $2}' | sort | fzf-tmux)"
  if [ -n "$selected_host" ]; then
    BUFFER="kyrat ${selected_host}"
    zle accept-line
  fi
  zle reset-prompt
}
zle -N _fzf_ssh
bindkey '^\' _fzf_ssh

function gibo() {
  if [ -z "$2" ] &&  [ "dump" = "$1" ]; then
    command gibo list | sed -e 's/=== .\+ ===//g' | sed -e 's/\s\+/\n/g' | grep -v '^\s*$' | fzf-tmux | xargs -I@ gibo dump @ >> .gitignore
  else
    command gibo $*
  fi
}
