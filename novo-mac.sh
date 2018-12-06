# Configurar trackpad e drag em acessibilidade

# Keyboard - Set a fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
# Keyboard - Set a fast keyboard start repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 15
# Keyboard - Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# Keyboard - Enable keyboard access for all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3


# executar git apenas para abrir popup para instalar DevTools
git

# instalar homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew cask install visual-studio-code
