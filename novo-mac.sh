# Keyboard - Set a fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
# Keyboard - Set a fast keyboard start repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 15
# Keyboard - Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# Keyboard - Enable keyboard access for all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
