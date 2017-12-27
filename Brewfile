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

brew duti # configurar qual app abre qual extensão
brew imagemagick
brew ghostscript
brew ffmpeg
brew youtube-dl
brew mosh # ssh persistente
brew icdiff # colored diff side by side http://www.jefftk.com/icdiff

brew pgcli
brew mycli
brew poppler # PDF TOOLS
brew sox # command line audio editing
brew 'mas' # Apple Store cli: mas search Xcode, mas install 497799835
brew mysql
# automatic start
# ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
# mysql.server start # manual start

# https://github.com/chrissimpkins/Hack
# https://sourcefoundry.org/hack/playground.html
