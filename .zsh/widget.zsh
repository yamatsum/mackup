function history-fzf() {
    local tac=${commands[tac]:-"tail -r"}
    BUFFER=$( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | sed 's/ *[0-9]* *//' | eval $tac | awk '!a[$0]++' | fzf-tmux +s)
    CURSOR=$#BUFFER
}
zle     -N   history-fzf
bindkey '^R' history-fzf

function ghq-fzf() {
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
zle -N ghq-fzf
bindkey "^G" ghq-fzf

function ssh-fzf () {
  # local selected_host=$(grep "Host " ~/.ssh/config | grep -v '*' | cut -b 6- | fzf-tmux --query "$LBUFFER" )
  local selected_host="$(command egrep -i '^Host\s+.+' $HOME/.ssh/config $(find $HOME/.ssh/conf.d -type f 2>/dev/null) | command egrep -v '[*?]' | awk '{print $2}' | sort | fzf-tmux)"
  if [ -n "$selected_host" ]; then
    BUFFER="sshrc ${selected_host}"
    zle accept-line
  fi
  zle reset-prompt
}
zle -N ssh-fzf
bindkey '^\' ssh-fzf

function tree-fzf() {
  local SELECTED_FILE=$(tree --charset=o -f | fzf-tmux --query "$LBUFFER" | tr -d '\||`|-' | xargs echo)
  if [ "$SELECTED_FILE" != "" ]; then
    BUFFER="$EDITOR $SELECTED_FILE"
    zle accept-line
  fi
  zle reset-prompt
}
zle -N tree-fzf
bindkey "^T" tree-fzf

export FZF_DEFAULT_OPTS='
  --reverse
'
  # --color fg:#cccdd0,hl:#f9f9f9

function groot() {
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    cd `pwd`/`git rev-parse --show-cdup`
  fi
}
