alias g="git"
alias gp="git push -v --progress"
alias gd="git icdiff"
# alias gs="git status" # conflict with GhostScript
alias gt="git status"

# utilizar alias gs apenas se não estiver instalado o GhostScript
unalias gs &> /dev/null
[[ $(which gs) ]] || alias gs="git status"

unalias gc &> /dev/null
gc() { git commit -m "$*" && git status }

unalias ga &> /dev/null
ga() { git add -A $* && git status }
