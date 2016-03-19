ts=$(gdate +%s%3N) # medir o tempo para carregar este script. Precisa instalar brew install coreutils
#-----------------------------------------------------------------------------------------------------------------------

HERE=${0:a:h}
DOTFILES=$(dirname $HERE)

# choose oh-my-zsh or prezto, NEVER BOTH
# source $HERE/oh-my-zsh-rc.zsh
source $HERE/preztorc.zsh

# load zmv batch renamer
autoload -U zmv

# initialize rbenv (hehash is slow)
[[ $(which rbenv) ]] && eval "$(rbenv init - --no-rehash)"

# initialize direnv
[[ $(which direnv) ]] && eval "$(direnv hook zsh)"

# initialize autoenv
# source $(brew --prefix autoenv)/activate.sh

source $HERE/env.zsh
source $HERE/tools.zsh
source $HERE/tools/pdf.zsh
source $HERE/tools/media.zsh
source $HERE/tools/shell.zsh
source $HERE/git.zsh
source $HERE/fasd.zsh

# inicializar docker VM fora deste script para não ficar lento
alias docker-boot="source /Applications/Docker/Docker\ Quickstart\ Terminal.app/Contents/Resources/Scripts/start.sh"
# definir variáveis de ambiente para o comando docker funcionar
alias docker-env='eval "$(docker-machine env default)"'

# lista os npm instalados globalmente
alias npmglist='npm list -depth 0 -g | \grep @'

# utiliza versao gnu dos comandos nativos do mac, como date.
alias gnupath='addpath /usr/local/opt/coreutils/libexec/gnubin'

#-----------------------------------------------------------------------------------------------------------------------
te=$(gdate +%s%3N) # exibir o tempo levado em segundos
printf "%0.2fs\n" $((($te - $ts) / 1000.0))
unset ta ts
