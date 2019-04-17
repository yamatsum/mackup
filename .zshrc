for file in ~/.zsh/*.zsh; do
  source $file
done

export PATH=/usr/local/bin:/usr/bin:$PATH
export NVIM_ROOT="$HOME/.config/nvim"
# export EDITOR='nvim'
# export VISUAL='nvim'

# zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

cd (){ builtin cd "$@" && ls }

# Auto CD (by directory name or filepath)
setopt auto_cd

key=$(ssh-add -l)
if [ ${key} = 'The agent has no identities.' ] && [ -e ~/.ssh/id_rsa ]; then
  ssh-add -K ~/.ssh/id_rsa
fi

export GOENV_DISABLE_GOPATH=1
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"

eval "$(anyenv init -)"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
