
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

# NVM NODE NPM

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
source ~/.zshrc
nvm install stable
npm install -g npm

# CAIXA

# verificar módulo de segurança da caixa
open -a Safari 'https://imagem.caixa.gov.br/asc/diagnostico.htm'
