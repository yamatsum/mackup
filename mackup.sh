# for iCloud
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/mackup/.mackup ~/.mackup
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/mackup/.mackup.cfg ~/.mackup.cfg

# install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install node-build
git clone https://github.com/riywo/node-build.git $(ndenv root)/plugins/node-build
