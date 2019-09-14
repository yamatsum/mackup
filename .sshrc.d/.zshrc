## Zsh:
setopt auto_cd
setopt auto_list
setopt auto_menu
autoload -U compinit; compinit
cd (){ builtin cd "$@" && ls }
[[ -n "$VIMRUNTIME" ]] && PROMPT="%{${fg[green]}${bg[black]}%}(  )%{${reset_color}%} $PROMPT"
## linuxbrew
PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
## anyenv
eval "$(anyenv init -)"

## Alias:
# neovim
# which nvim > /dev/null 2>&1 && alias v='nvim' && alias vi='nvim'
if type nvim > /dev/null 2>&1; then
  alias v='nvim' && alias vi='nvim'
else
  alias v='vim' && alias vi='vim'
fi
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
# tmux
alias tmuxa='tmux a -t'
alias tmuxl='tmux ls'
# docker alias
alias d="sudo docker"
alias dps="d ps" #=docker container ls
alias dpa="d ps -a"
alias di="d image"
alias dip="d image prune"
alias dis="d images"
alias db="d bulid"
alias dex="d exec -i -t"
alias dsp="d system prune"
alias dl="d pull"
# docker-compose alias
alias dc="sudo docker-compose"
alias k='kubectl'

## Kubernetes
export MINIKUBE_WANTUPDATENOTIFICATION=false
export MINIKUBE_WANTREPORTERRORPROMPT=false
export MINIKUBE_HOME=$HOME
export CHANGE_MINIKUBE_NONE_USER=true
export KUBECONFIG=$HOME/.kube/config
source <(kubectl completion bash)

## golang
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:/usr/local/go/bin:$PATH
# eval "$(goenv init - zsh)"
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
export GO111MODULE=on
