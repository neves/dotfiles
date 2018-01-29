# homebrew
PATH="/usr/local/sbin:$PATH"

# dotfiles bin
PATH="$DOTFILES/bin:$PATH"

# PWD/bin https://github.com/thoughtbot/dotfiles/blob/master/zsh/configs/post/path.zsh#L10 
PATH=".git/safe/../../bin:$PATH"
export -U PATH

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='subl --wait'
fi

export GEM_EDITOR=$EDITOR

export SSH_KEY_PATH="$HOME/.ssh/id_rsa"
