# show latest npm package version
function npmv() {
  curl "https://api.npms.io/v2/package/$1" 2&> /dev/null | jq '.collected.metadata.version'
}

# ip local da máquina
alias ip-local="ipconfig getifaddr $(ifconfig | grep ^en | head -n1 | cut -d: -f1)"
# ip remoto
alias ip-remote="dig +short myip.opendns.com @resolver1.opendns.com"

# opened server ports
alias ports="netstat -an -f inet -p tcp | grep LISTEN"

# roda git no $HOME
alias gh='GIT_DIR=$HOME/Dropbox/osx/home.git git'

# fuzzy search node_modules, npm node_modules global and yarn
alias fn="ls -1 ./node_modules | fzf -e --reverse"
alias fng="ls -1 /usr/local/lib/node_modules | fzf -e --reverse"
alias fy="ls -1 ~/.config/yarn/global/node_modules | fzf -e --reverse"

# nome do wifi
function wifi-name() {
  /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I \
  | awk '/ SSID/ {print substr($0, index($0, $2))}'
}

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

pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

path-prepend() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
      PATH="$1:${PATH+"$PATH"}"
  fi
}

alias addpath=pathadd

alias paths='echo $PATH | tr ":" "\n"'

alias fsize="stat -f %z"

# FileSearch
function f() { find . -iname "*$1*" ${@:2} }

lw() { l $(which $1); }

bkp() { mv "$1" "$1.bak"; }
bkp-undo() { mv "$1.bak" "$1"; }

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

count_files() {
  for f in $*
  do
    ls -1 "$f" | wc -l
  done
}

iso2img() {
  name=$(basename $1 .iso)
  hdiutil convert $1 -format UDRW -o $name;
  mv $name.dmg $name.img
}

img2iso() {
  name=$(basename $1 .img)
  hdiutil convert $1 -format UDTO -o $name;
  mv $name.cdr $name.iso
}

# mv files from folder to parent and remove folder
# mv -f */* . && for dir in */; do echo $dir; rmdir "$dir"; done

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
