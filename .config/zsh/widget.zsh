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

function gibo() {
  if [ -z "$2" ] &&  [ "dump" = "$1" ]; then
    command gibo list | sed -e 's/=== .\+ ===//g' | sed -e 's/\s\+/\n/g' | grep -v '^\s*$' | fzf-tmux | xargs -I@ gibo dump @ >> .gitignore
  else
    command gibo $*
  fi
}

export FZF_DEFAULT_OPTS='
  --reverse
  --prompt="  "
  --pointer="❯"
  --marker="❯"
  --color=fg:-1,bg:-1,hl:#E06C75,fg+:#ABB2BF,bg+:#2C313C,hl+:#E06C75
  --color=info:#98c379,prompt:#61afef,pointer:#61afef,marker:#e5c07b,spinner:#61afef,header:#61afef,gutter:#282C34
  --bind="ctrl-f:preview-page-down"
  --bind="ctrl-b:preview-page-up"
  --bind="ctrl-j:preview-down"
  --bind="ctrl-k:preview-up"
'

function groot() {
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    cd `pwd`/`git rev-parse --show-cdup`
  fi
}

function G() {
    forgit::inside_work_tree || return 1

    local files opts preview extract esc modified added deleted renamed

    # NOTE: paths listed by 'git status -su' mixed with quoted and unquoted style
    # remove indicators | remove original path for rename case | remove surrounding quotes
    extract="
        sed 's/.*  //' |
        sed 's/.* -> //' |
        sed -e 's/^\\\"//' -e 's/\\\"\$//'"
    preview="
        file=\$(echo {} | $extract)
        if (git status -s -- \$file | grep '^??') &>/dev/null; then  # diff with /dev/null for untracked files
            git diff --color=always --no-index -- /dev/null \$file | $forgit_pager | sed '2 s/added:/untracked:/'
        else
            git diff --color=always -- \$file | $forgit_pager
        fi"
    opts="
        $FORGIT_FZF_DEFAULT_OPTS
        -0 -m --nth 2..,..
        --preview=\"$preview\"
        $FORGIT_ADD_FZF_OPTS
    "
    esc=$(printf '\033')
    modified="${esc}[33m${esc}[0m" # yellow
    added="${esc}[32m${esc}[0m" # green
    deleted="${esc}[31m${esc}[0m" # red
    renamed="${esc}[34m${esc}[0m" # blue

    # echo " $(git status -su|wc -l|sed 's/ //g') changed file"

    files=$(git -c status.relativePaths=true status -su |
        sed -E 's/^(..[^[:space:]]*)[[:space:]]+(.*)$/\1 \2/' |
        sed -E "s/^(\ M|M\ |MM)\ (.*)$/${modified}  \2/" |
        sed -E "s/^\?\?\ (.*)$/${added}  \1/" |
        sed -E "s/^\ \D\ (.*)$/${deleted}  \1/" |
        sed -E "s/^R\ \ (.*)$/${renamed}  \1/" |
        FZF_DEFAULT_OPTS="$opts $FZF_DEFAULT_OPTS  " fzf |
        sh -c "$extract")
    [[ -n "$files" ]] && echo "$files"| tr '\n' '\0' |xargs -0 -I% git add % && git commit && return
    echo 'Nothing to do.'
}
