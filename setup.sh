# setup symlink for iCloud
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs ~/iCloud
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/mackup/.mackup ~/.mackup
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/mackup/.mackup.cfg ~/.mackup.cfg

# setup XDG_CONFIG_HOME
if [[ -z "$XDG_CONFIG_HOME" ]]
then
  echo 'export XDG_CONFIG_HOME="$HOME/.config/"' >> ~/.zshenv
fi

# setup zsh
echo 'source "$XDG_CONFIG_HOME/zsh/zshrc"' >> ~/.zshrc

# install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
