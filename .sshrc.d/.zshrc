## Zsh:
setopt auto_cd
setopt auto_list
setopt auto_menu
autoload -U compinit; compinit
cd (){ builtin cd "$@" && ls }
[[ -n "$VIMRUNTIME" ]] && PROMPT="%{${fg[green]}${bg[black]}%}(  )%{${reset_color}%} $PROMPT"

## Alias:
# neovim
which nvim > /dev/null 2>&1 && alias vi='nvim'
# git alias
alias g='git'
alias ga='git add'
alias gb='git branch'
alias gba='git branch -a'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gd='git diff'
alias gl='git pull'
alias gp='git push'
alias grhh='git reset --hard HEAD'
# docker alias
alias d="sudo docker"
alias dps="d ps"
alias dpa="d ps -a"
alias di="d image"
alias dip="d image prune"
alias dis="d images"
alias db="d bulid"
alias dex="d exec -i -t"
alias dsp="d system prune"
# docker-compose alias
alias dc="sudo docker-compose"
