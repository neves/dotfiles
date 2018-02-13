# Primeiro configurar iCloud no mac
clear
unalias ln
echo '.........................................................................'

# Desligar bloqueio de apps baixadas
# System Preferences > Security & Privacy > Allow apps downloaded from: Anyware
sudo spctl --master-disable

# USER CONFIG

# linkar a pasta osx do icloud ou Dropbox para o home
ln -Fsn ~/Library/Mobile\ Documents/com~apple~CloudDocs ~/icloud
ln -Fsn ~/icloud/osx ~/osx

ln -fs ~/osx/.gitconfig.user ~/.gitconfig.user
# hardlink
ln -f ~/osx/.zhistory ~/.zhistory
ln -f ~/osx/.fasd ~/.fasd
# ssh
ln -Fsn ~/osx/ssh ~/.ssh
chmod go-rwx ~/.ssh/*
chmod go-rwx ~/.ssh

# ------------------------------------------------------------------------------

# install brew and Xcode-Tools + Git (5min) Click Install and accept Terms on new screen
echo y | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# automatiza brew update todo dia as 11:00
mkdir -p ~/Library/LaunchAgents
curl -L https://github.com/mkalmes/brewupdate/raw/develop/brewupdate-install.sh | bash

# ------------------------------------------------------------------------------

# dotfiles
git clone git@github.com:neves/dotfiles.git ~/dotfiles || true
ln -fs ~/dotfiles/gitconfig ~/.gitconfig
ln -fs ~/dotfiles/gitignore_global ~/.gitignore_global

# ------------------------------------------------------------------------------

# ZSH
[ "$SHELL" = "/bin/zsh" ] || chsh -s /bin/zsh
echo "source ~/dotfiles/zsh/zshrc.zsh" > .zshrc
git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto || true

# Agora a instalação é feita pelo .Brewfile no home
ln -fs ~/dotfiles/Brewfile ~/.Brewfile
brew bundle check --global || brew bundle --global -v

# ------------------------------------------------------------------------------

# PDF
wget -O /usr/local/bin/cpdf http://github.com/coherentgraphics/cpdf-binaries/raw/master/OSX-Intel/cpdf
chmod +x /usr/local/bin/cpdf

# ------------------------------------------------------------------------------

# ASDF Universal Version Manager https://github.com/asdf-vm/asdf

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.1
$HOME/.asdf/asdf.sh

# ruby 2.3.3p222 (2016-11-21 revision 56859) [universal.x86_64-darwin17] PADRÃO do High Sierra 13.3
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
# por padrao nao instala docs
asdf install ruby 2.5.0
asdf global ruby 2.5.0

# Node
brew install gpg
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

asdf install nodejs 9.4.0
asdf global nodejs 9.4.0
brew install yarn --without-node
brew heroku # agora depende do node
# salva versões padrões em ~/.tool-versions

# ------------------------------------------------------------------------------

# RUBY agora utiliza ASDF
# echo 'gem: --no-ri --no-rdoc -V' > ~/.gemrc
# ln -fs ~/dotfiles/.pryrc ~/.pryrc
# ruby-install -L
# ruby-install --no-reinstall --cleanup ruby -- --disable-install-rdoc

# Docker do brew não utiliza Hyperkit, utilizar direto do site
wget -O ~/Downloads/Docker.dmg https://download.docker.com/mac/stable/Docker.dmg
sudo hdiutil attach ~/Downloads/Docker.dmg
\cp -rf /Volumes/Docker/Docker.app /Volumes/Docker/Applications
sudo hdiutil detach /Volumes/Docker

# ------------------------------------------------------------------------------

# Caskfile
brew bundle --file=~/dotfiles/Caskfile -v
