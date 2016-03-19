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

# executar um arquivo .nw ou um diretório
alias nw="/opt/homebrew-cask/Caskroom/node-webkit/0.10.5/node-webkit-v0.10.5-osx-x64/node-webkit.app/Contents/MacOS/node-webkit"

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
