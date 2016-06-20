# simulate gdate
type gdate >/dev/null 2>&1 || function gdate() { date $1 | cut -c 1-11 }
ts=$(gdate +%s%3N) # medir o tempo para carregar este script. Precisa instalar brew install coreutils
#-----------------------------------------------------------------------------------------------------------------------

HERE=${0:a:h}
DOTFILES=$(dirname $HERE)

# choose oh-my-zsh or prezto, NEVER BOTH
# source $HERE/oh-my-zsh-rc.zsh
source $HERE/preztorc.zsh
# load zmv batch renamer
autoload -U zmv

# initialize direnv
type direnv >/dev/null 2>&1 && eval "$(direnv hook zsh)"

source $HERE/ruby.zsh
source $HERE/env.zsh
source $HERE/tools.zsh
source $HERE/tools/pdf.zsh
source $HERE/tools/media.zsh
source $HERE/tools/shell.zsh
source $HERE/git.zsh
source $HERE/nvm.zsh # Node Version Manager
source $HERE/gcloud.zsh # Google Cloud/AppEngine
type fasd >/dev/null 2>&1 && source $HERE/fasd.zsh # z jump

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # fuzzy terminal search

#-----------------------------------------------------------------------------------------------------------------------
te=$(gdate +%s%3N) # exibir o tempo levado em segundos
printf "%0.2fs\n" $((($te - $ts) / 1000.0))
unset ta ts
