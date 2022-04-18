# show library in home
# [Finder -> option + Go]
chflags nohidden ~/Library && xattr -d com.apple.FinderInfo  ~/Library
# setup symlink for iCloud
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs ~/iCloud
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/mackup/.mackup ~/.mackup
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/mackup/.mackup.cfg ~/.mackup.cfg

# setup XDG_CONFIG_HOME
if [[ -z "$XDG_CONFIG_HOME" ]]
then
  echo 'export XDG_CONFIG_HOME="$HOME/.config"' >> ~/.zshenv
fi

# setup zsh
echo 'source "$XDG_CONFIG_HOME/zsh/zshrc"' >> ~/.zshrc

# install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# change appearance dark
defaults write "Apple Global Domain" "AppleInterfaceStyle" "Dark"

# hide dock
defaults write com.apple.dock autohide -bool true

# remove recent app from dock
defaults write com.apple.dock show-recents -bool FALSE

# display battery with percentage
# [menubar -> battery]
defaults write com.apple.menuextra.battery ShowPercent YES

# change caps lock to control
# [System Preferences-> keyboard -> modify key]
keyboard_id="$(ioreg -c AppleEmbeddedKeyboard -r | grep -Eiw "VendorID|ProductID" | awk '{ print $4 }' | paste -s -d'-\n' -)-0"
- defaults -currentHost write -g com.apple.keyboard.modifiermapping.${keyboard_id} -array-add "
<dict>
  <key>HIDKeyboardModifierMappingDst</key>\
  <integer>30064771300</integer>\
  <key>HIDKeyboardModifierMappingSrc</key>\
  <integer>30064771129</integer>\
</dict>"

# change key repeat speed
# [System Preferences-> keyboard]
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 15

# turn off capitalize words auto
# [System Preferences-> Keyboard -> Text]
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# use three finger drag
# [System Preferences-> accessibility -> Pointer Control -> Mouse & Trackpad]
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

# tap with one finger
# [System Preferences-> Trackpad]
defaults -currentHost write -globalDomain com.apple.mouse.tapBehavior -int 0

# show all filename extensions
# [finder -> preferences -> Advanced]
defaults write -g AppleShowAllExtensions -bool true

# show path bar in finder
defaults write com.apple.finder ShowPathbar -bool true 

# turn off auto rearrange spaces
# [System Preferences-> Mission Control]
defaults write com.apple.dock mru-spaces -bool false

# set screenshot location
defaults write com.apple.screencapture location ~/Pictures/Screenshots
