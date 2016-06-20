# copiar chave do mac para o ubuntu
# ssh-copy-id ubuntu@192.168.0.17

sudo sh -c "echo 'ubuntu ALL = (ALL) NOPASSWD: ALL' > /etc/sudoers.d/ubuntu"
sudo apt-get update
sudo apt-get -y install openssh-server
sudo apt-get -y install htop
sudo apt-get -y install git
sudo apt-get -y install zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# ruby-install
wget -O ruby-install-0.6.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz
tar -xzvf ruby-install-*
cd ruby-install-0.6.0
sudo make install
cd ..
rm -rf ruby-install-*
RUBY_CONFIGURE_OPTS=--disable-install-doc ruby-install ruby

wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
tar -xzvf chruby-*
cd chruby-0.3.9
sudo make install
cd ..
rm -rf chruby-*

echo 'gem: --no-ri --no-rdoc -V' > ~/.gemrc

# sqlite ruby dependencies
sudo apt-get -y install libsqlite3-dev

# Add to ~/.zshrc e reiniciar terminal
# if [ -n "$BASH_VERSION" ] || [ -n "$ZSH_VERSION" ]; then
#   source /usr/local/share/chruby/chruby.sh
#   source /usr/local/share/chruby/auto.sh
#   chruby ruby
# fi

# linux brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/linuxbrew/go/install)"
# sudo apt-get -y install m4 python-setuptools texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev
sudo apt-get -y install m4

# nvm: node version manager
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
# restart terminal
nvm install v6
npm install -g local-npm

# cache rubygems
# https://hub.docker.com/r/minimum2scp/geminabox/

# chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt-get -y install libindicator7 libappindicator1
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
