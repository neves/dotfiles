# Primeiro configurar iCloud no mac, depois linkar a pasta osx para o home
clear
unalias ln
echo '.................................................................................................................'

# USER CONFIG

unlink ~/osx
ln -Fs ~/Library/Mobile\ Documents/com~apple~CloudDocs/osx ~/osx
ln -fs ~/osx/.gitconfig.user ~/.gitconfig.user
unlink ~/.ssh
ln -Fs ~/osx/.ssh ~/.ssh
chmod go-rwx ~/.ssh/*
chmod go-rwx ~/.ssh

# install brew and Xcode-Tools + Git (5min) Click Install and accept Terms on new screen
echo y | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# automatiza brew update todo dia as 11:00
mkdir -p ~/Library/LaunchAgents
curl -L https://github.com/mkalmes/brewupdate/raw/develop/brewupdate-install.sh | bash

# dotfiles
git clone https://github.com/neves/dotfiles.git ~/dotfiles || true
ln -fs ~/dotfiles/gitconfig ~/.gitconfig
ln -fs ~/dotfiles/gitignore_global ~/.gitignore_global

# ZSH
[ "$SHELL" = "/bin/zsh" ] || chsh -s /bin/zsh
echo "source ~/dotfiles/zsh/zshrc.zsh" > .zshrc
git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto || true

# Agora a instalação é feita pelo .Brewfile no home
ln -fs ~/dotfiles/Brewfile ~/.Brewfile
brew bundle check --global || brew bundle --global -v

# PDF
wget -O /usr/local/bin/cpdf http://github.com/coherentgraphics/cpdf-binaries/raw/master/OSX-Intel/cpdf
chmod +x /usr/local/bin/cpdf

# RUBY
echo 'gem: --no-ri --no-rdoc -V' > ~/.gemrc
ln -fs ~/dotfiles/.pryrc ~/.pryrc
ruby-install -L
ruby-install --no-reinstall --cleanup ruby -- --disable-install-rdoc

# Caskfile
brew bundle --file=~/dotfiles/Caskfile -v
