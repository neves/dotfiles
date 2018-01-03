#!/bin/bash

# curl https://raw.githubusercontent.com/neves/dotfiles/master/osx_defaults.sh | bash

# https://github.com/herrbischoff/awesome-osx-command-line/blob/master/README.md

clear

# Keyboard - Set a fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
# Keyboard - Set a fast keyboard start repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 10
# Keyboard - Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# Keyboard - Enable keyboard access for all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Finder - Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true
# Finder - Show filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Finder - Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Finder - Show path bar
defaults write com.apple.finder ShowPathbar -bool true
# Finder - Show status bar
defaults write com.apple.finder ShowStatusBar -bool true
# Finder - Display full POSIX path as window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# Finder - Allow quitting via COMMAND+Q -- Doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true
# Finder - Set Current Folder as Default Search Scope
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# Set Default Finder Location to Home Folder
defaults write com.apple.finder NewWindowTarget -string "PfLo" && \
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Downloads"

# Safari Enable Develop Menu and Web Inspector
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write -g WebKitDeveloperExtras -bool true
# Safari Use Backspace/Delete to Go Back a Page
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool YES

# System - Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
# System - Disable the 'Are you sure you want to open this application?' dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false
# System - Increase window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
# System - Avoids creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# System - Avoids creation of .DS_Store and AppleDouble files
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# System - Get SF Mono Fonts
cp /Applications/Utilities/Terminal.app/Contents/Resources/Fonts/SFMono-* ~/Library/Fonts

# System - Put Computer to Sleep after 30 Minutes of Inactivity
sudo pmset sleep 30
# System - Put Display to Sleep after 15 Minutes of Inactivity
sudo pmset displaysleep 15
# Disable Sound Effects on Boot
sudo nvram SystemAudioVolume=" "

killall Finder
killall Dock

# Não habilitar trimforce para SSD formatado com sistema de arquivo APFS,
# caso contrário o boot sobe de 30s para 1m45s!!!
# precisa confirmação. http://www.digitalcitizen.life/simple-questions-what-trim-ssds-why-it-useful
# echo 'Executar o comando abaixo para HD SSD:'
# echo 'sudo trimforce enable'
