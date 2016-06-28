
curl https://raw.githubusercontent.com/neves/dotfiles/master/osx_defaults.sh | sudo bash

# HomeBrew

# install brew and Xcode-Tools + Git (5min) Click Install and accept Terms on new screen
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew update

# neves/dotfiles
git clone https://github.com/neves/dotfiles.git ~/dotfiles
ln -s $HOME/dotfiles/gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/gitconfig.user $HOME/.gitconfig.user
ln -s $HOME/dotfiles/.pryrc $HOME/.pryrc
echo 'source ~/dotfiles/zsh/zshrc.zsh' > .zshrc

# Agora a instalação é feita pelo Brewfile no dotfiles
ln -sf ~/dotfiles/Brewfile ~/.Brewfile
brew bundle --global -v

# automatiza brew update todo dia as 11:00
mkdir -p $HOME/Library/LaunchAgents
curl -L https://github.com/mkalmes/brewupdate/raw/develop/brewupdate-install.sh | bash

# Default Files Association
~/dotfiles/ftypes/assoc.rb

# ZSH

# link .ssh
[ "$SHELL" = "/bin/zsh" ] || chsh -s /bin/zsh
ln -fs ~/Dropbox/osx/ssh ~/.ssh
chmod go-rwx .ssh/*
ln -sf ~/Dropbox/osx/zsh/.zsh_history ~/.zsh_history

# prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto

# RUBY

ruby-install ruby
echo 'gem: --no-ri --no-rdoc -V' > ~/.gemrc
echo 'ruby-2.3.1' > ~/.ruby-version
source ~/.zshrc
gem install rails git-up
heroku
# gemset
brew install --HEAD https://raw.github.com/postmodern/gem_home/master/homebrew/gem_home.rb

# NVM NODE NPM

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash
source ~/.zshrc
nvm install stable
npm install -g npm

# PDF

brew install poppler

wget -O /usr/local/bin/cpdf http://github.com/coherentgraphics/cpdf-binaries/raw/master/OSX-Intel/cpdf
chmod +x /usr/local/bin/cpdf


# Editor markdown com inline preview (versão no brew desatualizada)
# https://github.com/brrd/Abricotine/releases
cd ~/Downloads
wget https://github.com/brrd/Abricotine/releases/download/0.3.2/Abricotine-osx-x64.zip
unzip Abricotine-osx-x64.zip
mv Abricotine-darwin-x64/Abricotine.app ~/Applications/
rm -rf Abricotine-osx-x64*

# ATOM

apm install sync-settings
# Regenerate Token: https://github.com/settings/tokens/31656846
# gist id: e83989181ccb819924285c2e5080c41b

# IEVMS

brew cask install virtualbox
brew cask install virtualbox-extension-pack
# Configurar pasta padrão das vms em: /Volumes/TERA/virtualbox
open -a VirtualBox
# instalar no HD externo
curl -s https://raw.githubusercontent.com/xdissent/ievms/master/ievms.sh | env INSTALL_PATH="/Volumes/TERA/ievms" IEVMS_VERSIONS="11" bash

# CAIXA

# verificar módulo de segurança da caixa
open -a Safari 'https://imagem.caixa.gov.br/asc/diagnostico.htm'
