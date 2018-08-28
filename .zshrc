# Set iTerm2 titlebar color(It works only with Sierra. It does not work in High Sierra)
echo -e "\033]6;1;bg;red;brightness;40\a"
echo -e "\033]6;1;bg;green;brightness;44\a"
echo -e "\033]6;1;bg;blue;brightness;52\a"


for file in ~/zsh/*.zsh; do
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
if [ ${key} = 'The agent has no identities.' ]; then
  ssh-add -K ~/.ssh/id_rsa
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"

export NDENV_ROOT="$HOME/.ndenv"
export PATH="$NDENV_ROOT/bin:$PATH"
eval "$(ndenv init -)"

export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"

export PATH=$PATH:`npm bin -g`

export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
