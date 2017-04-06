alias g="git"
alias gp="git push -v --progress --follow-tags"
alias gd="git icdiff"
# alias gs="git status" # conflict with GhostScript
alias gt="git status -s"
alias gdc="gd --cached"

# utilizar alias gs apenas se não estiver instalado o GhostScript
unalias gs &> /dev/null
[[ $(which gs) ]] || alias gs="git status -s"

unalias gc &> /dev/null
gc() { noglob git commit -m "$*" && git status }

unalias ga &> /dev/null
ga() { git add -A $* && git status }
