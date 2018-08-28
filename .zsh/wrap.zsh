if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi

function ssh() {
  if [[ -n $(printenv TMUX) ]] ; then
    local pane_id=`tmux display -p '#{pane_id}'`

    if [[ `echo $@ | grep -E '((^artifactory|(^aclm|^nfs|^proxy).*artifactory)|(^registry|^cache|^dss|^selfservice).*docker|^npme|(^bm|^m|^e|^ie|^me|^c)\d.*dist|^ymave).*'` ]] ; then
      trap 'echo trap INT or TERM' INT
      tmux select-pane -P 'fg=red'
      # If want to change the title
      # tmux select-pane -T `'$@'`
    fi
    # ssh or sshrc
    command sshrc $@
    tmux select-pane -t $pane_id -P 'default'
  else
    # ssh or sshrc
    command sshrc $@
  fi
}
