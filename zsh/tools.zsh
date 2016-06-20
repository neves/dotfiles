# inicializar docker VM fora deste script para não ficar lento
alias docker-boot="source /Applications/Docker/Docker\ Quickstart\ Terminal.app/Contents/Resources/Scripts/start.sh"
# definir variáveis de ambiente para o comando docker funcionar
alias docker-env='eval "$(docker-machine env default)"'

# lista os npm instalados globalmente
alias npmglist='npm list -depth 0 -g | \grep @'

# utiliza versao gnu dos comandos nativos do mac, como date.
alias gnupath='addpath /usr/local/opt/coreutils/libexec/gnubin'

alias markright="open -a ~/Applications/MarkRight.app"

# try inflections in console
alias pry-inflections="pry -f -r'active_support/inflector' -r'./config/initializers/inflections'"

# open in default $EDITOR the last migration created in a Rails app
# alias last_migration="$EDITOR db/migrate/$(ls db/migrate/ | sort | tail -1)"

# converte double quotes to single quotes
# ou: gsed -i "y/\"/'/"
function single-quotes(){ sed -i '' "y/\"/'/" "$1" }

# feature #40 #9 (creates branch feature/sprint-40-story-9)
alias feature="ruby -e 'print %(feature/sprint-%d-story-%d) % ARGV.join.scan(/\d+/)'"

# http://entrproject.org/
entr-rspec() {
  if [ $# -lt 1 ]
  then
    echo 'entr-rspec spec.rb'
    return
  fi
  echo $1 | entr -c rspec /_
}

# ip do gateway da rede
gateway() {
  netstat -r | grep default | awk '{ print $2 }'
}

# parar o rails iniciado com rails server -d
alias rails_stop='(test -f tmp/pids/server.pid && kill -INT $(cat tmp/pids/server.pid) && echo Rails Stopped) || echo pid not found'

alias rails_restart="spring stop; rails_stop; rails s -d; rake log:clear tmp:clear &;"

# disable plugin loading for faster startup
alias pry="pry --no-plugins"

# parse yml file
alias yml="ruby -e \"require 'yaml'; require 'pp';  pp YAML.load_file ARGV[0]\""

# rails template: rt nome-da-receita
rt() {
  if [ $# -lt 1 ]
  then
    echo 'Usage: rt recipe-name'
    echo 'Listar: rt help'
    echo 'Comitar rt <recipe> commit'
    return
  fi

  if [ "Gemfile" -nt "Gemfile.lock" ]; then
    echo 'before: bundle install ...'
    bundle install
    touch Gemfile.lock
    spring stop
  fi

  bin/rake rails:template LOCATION=~/Dropbox/projects/rails/template/template.rb RECIPE=$1 COMMIT=$2

  if [ "Gemfile" -nt "Gemfile.lock" ]; then
    echo 'after: bundle install ...'
    bundle install
    touch Gemfile.lock
  fi
}
