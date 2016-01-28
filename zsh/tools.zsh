# try inflections in console
alias pry-inflections="pry -f -r'active_support/inflector' -r'./config/initializers/inflections'"

# open in default $EDITOR the last migration created in a Rails app
alias last_migration="$EDITOR db/migrate/$(ls db/migrate/ | sort | tail -1)"

# converte double quotes to single quotes
# ou: gsed -i "y/\"/'/"
function single-quotes(){ sed -i '' "y/\"/'/" "$1" }

# feature #40 #9 (creates branch feature/sprint-40-story-9)
alias feature="ruby -e 'print %(feature/sprint-%d-story-%d) % ARGV.join.scan(/\d+/)'"

# duplicate file in path with new name:
# Usage: duplicate path/to/file new-name
function duplicate(){ cp -r $1 "${1:h}/$2" }

# rename file in path with new name:
# Usage: rename path/to/file new-name
function rename(){ mv $1 "${1:h}/$2" }

# cria o caminho e o arquivo
touchpath() {
    if [ $# -lt 1 ]; then
        echo "Usage: touchpath path/to/file.txt";
        return 1;
    fi

    for f in "$@"; do
        mkdir -p -- "$(dirname -- "$f")"
        touch -- "$f"
    done
}

# http://entrproject.org/
entr-rspec() {
  if [ $# -lt 1 ]
  then
    echo 'entr-rspec spec.rb'
    return
  fi
  echo $1 | entr -c rspec /_
}

pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

# move file and replace with a link
mvln() {
  if [ $# -lt 2 ]
  then
    echo 'mvln ~/.gist ~/Dropbox/.gist'
    echo 'will move file ~/.gist to ~/Dropbox/.gist and link ~/Dropbox/.gist to ~/.gist'
    return
  fi
  mv $1 $2 && ln -sf $2 $1
}

alias addpath=pathadd

alias paths='echo $PATH | tr ":" "\n"'


alias fsize="stat -f %z"

# FileSearch
function f() { find . -iname "*$1*" ${@:2} }

lw() { l $(which $1); }

bkp() { mv "$1" "$1.bak"; lw "$1.bak"; }

# findBySize . +100MB
findBySize() {
    find $1 -type f -size $2 \( ! -name /Volumes/ \) -exec ls -lh {} \; 2> /dev/null | awk '{ print $5 "\t" $9 }'
}

alias pwdcp='pwd | pbcopy; echo "$PWD copiado para a área de transferência! Capturar com: cdpwd"'
cdpwd() {
  P=$(pbpaste)
  if [ -d "$P" ]; then
    cd $P
  fi
}

# simplifica o uso de for loops
loop() {
  if [ $# -lt 2 ]
  then
    echo "Usage: loop 'ls -lah \$fullpath' dir/*"
    echo 'Variables: fullpath, name, ext, prefix'
    echo 'Sample (convert pdf to png): loop ''convert $fullpath png/$prefix.png'' pfds/*.pdf'
    return
  fi
  cmd=$1
  # remove o primeiro argumento do array
  shift
  # loop no restante dos argumentos
  for fullpath in $*
  do
    # nome sem diretorio
    name=$(basename "$fullpath")
    # imprime o nome do arquivo em verde para stderr
    echo -e "\e[32m$name\e[0m" 1>&2
    # apenas extensao sem o ponto
    ext="${name##*.}"
    # apenas o nome, sem extensao
    prefix="${name%.*}"
    # executa o comando passado no primeiro parametro entre aspas
    eval $cmd
  done
}

# ip do gateway da rede
gateway() {
  netstat -r | grep default | awk '{ print $2 }'
}

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
  fi

  spring stop

  bin/rake rails:template LOCATION=~/Dropbox/projects/rails/template/template.rb RECIPE=$1 COMMIT=$2

  if [ "Gemfile" -nt "Gemfile.lock" ]; then
    echo 'after: bundle install ...'
    bundle install
    touch Gemfile.lock
  fi
}

# parar o rails iniciado com rails server -d
alias rails_stop='(test -f tmp/pids/server.pid && kill -INT $(cat tmp/pids/server.pid) && echo Rails Stopped) || echo pid not found'

alias rails_restart="spring stop; rails_stop; rails s -d; rake log:clear tmp:clear &;"

# disable plugin loading for faster startup
alias pry="pry --no-plugins"

function colorspace() {
  identify -verbose "$1[0]" | grep Colorspace
}

# parse yml file
alias yml="ruby -e \"require 'yaml'; require 'pp';  pp YAML.load_file ARGV[0]\""

# executar um arquivo .nw ou um diretório
alias nw="/opt/homebrew-cask/Caskroom/node-webkit/0.10.5/node-webkit-v0.10.5-osx-x64/node-webkit.app/Contents/MacOS/node-webkit"

count_files() {
  for f in $*
  do
    ls -1 "$f" | wc -l
  done
}

image_size() {
  for f in $*
  do
    identify "$f" | cut -d ' ' -f 3
  done
}

# extend image and center to a size
# src, size, dest
center-image() {
  if [ $# -lt 3 ]
  then
    echo 'Usage: center-image path.png 320x240 output.png'
    return
  fi
  convert $1 -gravity center -background transparent -extent $2 $3
}

# mv files from folder to parent and remove folder
# mv -f */* . && for dir in */; do echo $dir; rmdir "$dir"; done
