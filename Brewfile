# brew bundle --global -v

# Patch para permitir utilizar nomes sem aspas
class Quoteless < String
  def - other; join '-', other end
  def / other; join '/', other end
  private
  def join char, other; self.class.new(self + char + other) end
end

def method_missing(name)
  Quoteless.new(name.to_s)
end

# Brewfile like Gemfile: https://github.com/Homebrew/homebrew-bundle
tap 'Homebrew/bundle'
# http://caskroom.io/
tap 'caskroom/cask'
# add beta versions of softwares: https://github.com/caskroom/homebrew-versions
tap 'caskroom/versions'
# repositório com várias softwares Unix GNU
tap 'homebrew/dupes'
tap 'caskroom/fonts'

# essential
brew wget
brew zsh
brew fzf # (find . | fzf) https://github.com/junegunn/fzf
brew ssh-copy-id # easy copy ssh id to remote server
brew sqlite3
brew entr # Run arbitrary commands when files change http://entrproject.org/
brew fasd # auto jump shell
brew coreutils # gnu
brew gnu-sed
brew git-imerge
brew the_silver_searcher # ag
brew direnv
brew heroku
brew chruby # melhor que rbenv
brew 'ruby-install' # melhor que ruby-build
brew yarn # força instalar o node global

# https://github.com/chrissimpkins/Hack
# https://sourcefoundry.org/hack/playground.html
cask font-hack

cask dropbox
cask iterm2 # http://iterm2.com/version3.html
cask sublime-text
cask google-chrome
cask firefox
cask evernote
cask rowanj-gitx
cask sourcetree
cask sequel-pro
cask spectacle # window management
cask flycut # clipboard history
cask vlc
cask subtitle-master
cask transmission
cask atom
cask dash # license.dash-license no DropBox/osx
# cask flux # amarelar a tela de noite, nao precisa no Sierra
cask postgres, args: { appdir: '/Applications' }
cask psequel
cask intel-power-gadget
# cask megasync, args: { appdir: '/Applications' }
# cask install box-sync
# cask install cheatsheet && open -a CheatSheet # keyboard shortcut holding CMD
# brew lightpaper # agora é pago

# default application used for various URL schemes, file extensions, file types, MIME types
cask rcdefaultapp
brew duti # configurar qual app abre qual extensão
brew imagemagick
brew ghostscript
brew ffmpeg
brew youtube-dl
brew mosh # ssh persistente
brew icdiff # colored diff side by side http://www.jefftk.com/icdiff
# brew mas # Apple Store cli: mas search Xcode, mas install 497799835
brew pgcli
brew mycli

brew mysql
# automatic start
# ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
# mysql.server start # manual start

# OPCIONAIS

# brew sox # command line audio editing
# cask ibettercharge # avisa quando a bateria do celular estiver acabando
# cask audioslicer # separar capítulos de audiobooks
# brew sqlitebrowser
# cask coconutbattery

ENV['AT_EXIT'] && at_exit do
  `open -a Dropbox`
  `open -a iTerm`
  `open -a 'Google Chrome'` # Ligar Avisar Antes de Sair CMD+Q
  `open -a Evernote`
  `open -a Flycut`
  `open -a Spectacle`

  # mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
  # ln -fs ~/Dropbox/osx/sublime3 ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
  `open -a 'Sublime Text'`
  # instalar package control e aguardar update: https://packagecontrol.io/installation
end
