export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "lukechilds/zsh-better-npm-completion", defer:2
zplug 'zsh-users/zsh-autosuggestions', at:develop
zplug "paulirish/git-open", as:plugin
zplug "lib/completion", from:oh-my-zsh
zplug "plugins/git",   from:oh-my-zsh
zplug "wfxr/forgit", as:plugin, defer:2

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
