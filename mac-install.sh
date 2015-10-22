# ......................................................................................................................
# OSX config
#.......................................................................................................................

# Works only after reboot
# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0

# Disable Mission control(F3) animation
defaults write com.apple.dock expose-animation-duration -float 0.05
# disable Ds_Store on network
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true
# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

killall Dock
killall Finder

# Config PHP
echo 'date.timezone = America/Sao_Paulo' | sudo tee /etc/php.ini

# ......................................................................................................................
# HomeBrew
#.......................................................................................................................

# install brew and Xcode-Tools + Git (5min) Click Install and accept Terms on new screen
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
# http://caskroom.io/
brew install caskroom/cask/brew-cask wget
brew update
# add beta versions of softwares: https://github.com/caskroom/homebrew-versions
brew tap caskroom/versions

# ......................................................................................................................
# DropBox
#.......................................................................................................................

brew cask install dropbox
# configurar para baixar apenas a pasta osx
open -a Dropbox

# ......................................................................................................................
# iTerm2
#.......................................................................................................................

# install latest iterm2: http://iterm2.com/version3.html
brew cask install iterm2-beta
# Apontar para a pasta no dropbox
open -a iTerm && exit

# Fonts: http://sourcefoundry.org/hack/
cd ~/Downloads
wget https://github.com/chrissimpkins/Hack/releases/download/v2.015/Hack-v2_015-ttf.zip
unzip Hack-*-ttf.zip
open Hack-*-ttf/Hack-*.ttf
rm Hack-*-ttf.zip

# ......................................................................................................................
# ZSH
#.......................................................................................................................

# link .ssh
ln -fs ~/Dropbox/osx/ssh ~/.ssh
ln -sf ~/Dropbox/osx/zsh/.zsh_history ~/.zsh_history

brew install zsh
chsh -s /bin/zsh

# prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto

# oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
# conflicts with zsh-completions
# git clone git@github.com:tarruda/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions.git ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/Valiev/almostontop.git ~/.oh-my-zsh/custom/plugins/almostontop

# neves/dotfiles
git clone git@github.com:neves/dotfiles.git ~/dotfiles
ln -s $HOME/dotfiles/gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/gitconfig.user $HOME/.gitconfig.user
ln -s $HOME/dotfiles/.pryrc $HOME/.pryrc
echo 'source ~/dotfiles/zsh/zshrc.zsh' > .zshrc

bash -c "`curl -sL get.freshshell.com`"

# ......................................................................................................................
# Default Files Association
#.......................................................................................................................

brew cask install rcdefaultapp # "Default Apps" no Spotlight
# configurar qual app abre qual extensão
brew install duti
~/dotfiles/ftypes/assoc.rb

# ......................................................................................................................
# SublimeText 3
#.......................................................................................................................

brew cask install sublime-text3
# linkar a pasta do DropBox para User do sublime
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
ln -fs ~/Dropbox/osx/sublime3 ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
open -a 'Sublime Text'
# instalar package control e aguardar update: https://packagecontrol.io/installation

# ......................................................................................................................
# passwordless sudo
#.......................................................................................................................

sudo mkdir -p /private/etc/sudoers.d
echo '%wheel ALL=(ALL) NOPASSWD: ALL' | sudo tee /private/etc/sudoers.d/passwordless
sudo dscl . append /Groups/wheel GroupMembership neves

# ......................................................................................................................
# automatiza brew update todo dia as 11:00
#.......................................................................................................................

mkdir -p $HOME/Library/LaunchAgents
curl -L https://github.com/mkalmes/brewupdate/raw/develop/brewupdate-install.sh | bash

# ......................................................................................................................
# Finder QuickLook extensions: https://github.com/sindresorhus/quick-look-plugins
#.......................................................................................................................

brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json quicklook-csv qlimagesize webpquicklook
brew cask install qlprettypatch betterzipql suspicious-package

# ......................................................................................................................
# brew install
#.......................................................................................................................

# essential
brew install ssh-copy-id sqlite3 entr fasd coreutils the_silver_searcher # ag

# essential tools
brew cask install google-chrome firefox evernote rowanj-gitx sourcetree sequel-pro lightpaper cheatsheet
open -a CheatSheet # keyboard shortcut holding CMD
open -a 'Google Chrome' # Ligar Avisar Antes de Sair CMD+Q
open -a Evernote
brew cask install --appdir=/Applications megasync
open -a Megasync
# brew cask install box-sync

# pdf/image
brew install imagemagick ghostscript
# other tools
brew install ffmpeg youtube-dl mosh
# colored diff side by side http://www.jefftk.com/icdiff
brew install icdiff

# pessoal.  Dash: license.dash-license no DropBox/osx
brew cask install vlc subtitle-master transmission dash
open -a Dash

# window shortcuts
brew cask install spectacle
open -a Spectacle

# ......................................................................................................................
# RUBY
# ......................................................................................................................

brew install rbenv ruby-build openssl mysql
ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents # Start mysql at login
brew link --force openssl
rbenv install 2.2.3
rbenv global 2.2.3
echo 'gem: --no-ri --no-rdoc -V' > ~/.gemrc
gem install bundler

#git up
gem install git-up rails

# auto rbenv rehash
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

# ruby tools
brew install direnv autoenv heroku-toolbelt
heroku keys

# node
# https://gist.github.com/DanHerbert/9520689
rm -rf /usr/local/lib/node_modules
brew uninstall node
brew install node --without-npm
echo prefix=~/.node >> ~/.npmrc
# aparece um erro mas funciona
# https://plus.google.com/u/0/photos/albums/p5v7mgnbb8esjrlpvs6dccrjhmcalecnt?pid=6207733812250015266&oid=110653845623131711583
curl -L https://www.npmjs.com/install.sh | sh

# ......................................................................................................................
# JAVA 8
# ......................................................................................................................

brew cask install java
open -a Firefox --args 'https://www.java.com/en/download/installed.jsp?detect=jre&try=1'
osascript -e 'tell application "Safari" to open location "https://www.java.com/en/download/installed.jsp?detect=jre"'

# ......................................................................................................................
# VirtualBox
# ......................................................................................................................

brew cask install virtualbox
# Docker Oficial setup
brew cask install dockertoolbox
# internet explorer WindowsXP VirtualBox
curl -s https://raw.githubusercontent.com/xdissent/ievms/master/ievms.sh | env IEVMS_VERSIONS="6 7 8" bash

# ......................................................................................................................
# SpotLight
# ......................................................................................................................

# excluir um volume do SpotLight (evitar criar arquivos) precisa estar conectado
sudo mdutil -d /Volumes/8GB
sudo rm -rf /Volumes/8GB/.fseventsd /Volumes/8GB/.Spotlight-V100
touch /Volumes/8GB/.metadata_never_index
sudo umount /Volumes/8GB

mdutil -d /Volumes/NEVES
# excluir utilizando hidden file
touch /Volumes/NEVES/.metadata_never_index

# Excluir arquivos ao ejetar
# http://www.javawa.nl/download.script/software=CleanEject&lang=en

# ......................................................................................................................
# Python
# ......................................................................................................................

# pip para instalar pacotes python
sudo chown -R $USER /Library/Python/2.7/site-packages
easy_install pip
pip install slugify
# pygmentize file # to syntax highlight on command line
pip install pygments

# ......................................................................................................................
# PDF
# ......................................................................................................................

# /usr/local/Cellar/poppler/0.36.0/bin/pdfinfo and others
brew install poppler
# CPDF
wget -O /usr/local/bin/cpdf http://github.com/coherentgraphics/cpdf-binaries/raw/master/OSX-Intel/cpdf
chmod +x /usr/local/bin/cpdf

# ......................................................................................................................
# CAIXA
# ......................................................................................................................

# verificar módulo de segurança da caixa
open -a Safari 'http://gastecnologia.com.br:8080/diagnostico'

# para instalar, precisa reinicar o mac segurando CMD+R
# Abrir o terminal e digitar csrutil disable

# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# OPTIONAL
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

cat <<'EOF' > ~/.odbc.ini
[ODBC Data Sources]
pg = PostgreSQL ANSI

[pg]
Driver     = /usr/local/lib/psqlodbcw.so
ServerName = localhost
Database   = postgres
Port       = 5432
EOF
# importar do postgresql para mysql
# https://support.apple.com/kb/dl895?locale=pt_BR
brew cask install mysqlworkbench psqlodbc
pip install pyodbc
# substituir pyodbc.so que vem com mysqlworkbench, pela ultima versão, pois não funciona
cp /Library/Python/2.7/site-packages/pyodbc.so \
/opt/homebrew-cask/Caskroom/mysqlworkbench/6.3.4/MySQLWorkbench.app/Contents/Resources/libraries/pyodbc.so
# testar conexão com pg pelo ODBC
/usr/local/Cellar/unixodbc/2.3.2_1/bin/isql pg


brew cask install adobe-reader

# Google Hangout Plugin
brew cask install google-hangouts

# Postgres Client
brew cask install psequel
# Postgres Server
brew cask install --appdir=/Applications postgres

# Editar Markdown
https://github.com/minodisk/markn

# DB Manager: http://www.valentina-db.com/en/valentina-studio-overview
brew cask install valentina-studio

# repositório com várias softwares Unix GNU
brew tap homebrew/dupes
# repositório com várias versões do PHP
brew tap homebrew/versions
brew tap josegonzalez/homebrew-php

brew install git-ftp

brew cask install xquartz
brew install poppler webp
brew install swftools --with-xpdf --with-jpeg
brew install https://raw.github.com/quantiverge/homebrew-binary/pdftk/pdftk.rb

# extras
unrar nginx p7zip composer

# Versão GNU de comandos Unix
# http://www.topbug.net/blog/2013/04/14/install-and-use-gnu-command-line-tools-in-mac-os-x/
brew install coreutils

# dev
brew install mysql sqlitebrowser ngrok

# start mysql at login
ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents

# ainda nao sei qual o melhor, java6 ou java7
brew cask install java6
brew cask install phpstorm rubymine
brew cask install vagrant

# Docker UI
brew cask install kitematic

# mobile
brew install android-sdk ant ios-sim

transmission-remote-gui asepsis android-file-transfer teamviewer unrar

# audio processing
brew install sox

# mac tools
brew cask install ibettercharge audioslicer

# repositório público de chaves ssh
https://github.com/progrium/keychain.io

# instalar autoload do Apache (-w permanent, reload after reboot)
sudo launchctl load -w /System/Library/LaunchDaemons/org.apache.httpd.plist
# habilitar o apache
sudo defaults write /System/Library/LaunchDaemons/org.apache.httpd Disabled -bool false

# repositório com várias softwares Unix GNU
brew tap homebrew/dupes

# repositório com várias versões do PHP
brew tap josegonzalez/homebrew-php
brew install php56 --with-apache
brew link php56

# NAO FUNCIONA NO EL CAPITAIN DEVIDO A MODIFICACAO DE SEGURANÇA
# desligar criação dos arquivos .DS_Store
brew cask install deathtodsstore
open -a DeathToDSStore --args -silent
# outra alternative é redirecionar os .DS_Store para uma única pasta global
brew cask install asepsis

# brew cask install rightzoom # nao funciona no yosemit

# extras
brew cask install robomongo
brew cask install appcleaner
brew cask install adobe-air
brew cask install git-annex
brew cask install pdftk
# para trabalhar com pdf e vetores
brew cask install xquartz
# painel de configuração de associação de extensões/URL Scheme
brew cask install rcdefaultapp
brew cask install vmware-fusion

# pessoal
brew cask install quickcast
brew cask install stella

# CASK MISSING: snes9x adobeair-sdk flexsdk

# colocar meu usuário como dono de /usr/local, para não precisar utilizar sudo
sudo chown -R $USER /usr/local
# npm global packages
brew install android-sdk ios-sim ant
npm install -g coffee-script bower gulp cordova plugman

# instalar a última versão do android sdk (visual)
android

# uninstall all rubygems
for i in `gem list --no-versions`; do sudo gem uninstall -aIx $i; done

#git up
sudo gem install git-up

# mac command line stats
gem install iStats

# mysql
brew install mysql
# automatic start
# ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
# manual start
mysql.server start

# ======================================================== NÃO PRECISA MAIS, UTILIZAR AGORA PELO CASK ==================

# Sublime url protocol: https://github.com/saetia/sublime-url-protocol-mac
cd ~/Downloads
wget https://github.com/saetia/sublime-url-protocol-mac/archive/master.zip
unzip master.zip
mv sublime-url-protocol-mac-master/Sublime\ Protocol.app ~/Applications/
open -a 'Sublime Protocol'
rm master.zip
rm -rf sublime-url-protocol-mac-master

# Sublime Extensions
# https://github.com/gornostal/Modific
# http://editorconfig.org/

# DiffMerge
cd ~/Downloads
wget http://download-us.sourcegear.com/DiffMerge/4.2.0/DiffMerge.4.2.0.697.intel.stable.dmg
hdiutil mount DiffMerge*.dmg
cp -r "/Volumes/DiffMerge 4.2.0.697 intel stable/DiffMerge.app" /Applications/
hdiutil unmount /Volumes/DiffMerge*
sudo ln -sf /Applications/DiffMerge.app/Contents/Resources/diffmerge.sh  /usr/bin/diffmerge
rm DiffMerge*.dmg

# install composer (https://getcomposer.org/doc/00-intro.md)
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# install PHPUnit
brew install phpunit
