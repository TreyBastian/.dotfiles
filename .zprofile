if [[ $(uname) == "Darwin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

alias dots='git --git-dir=$HOME/.dots/ --work-tree=$HOME'
