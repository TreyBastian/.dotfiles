if [[ $(uname) == "Darwin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export PATH=$PATH:$HOME/.rbenv/bin
  export PATH=$PATH:$HOME/.rbenv/shims
  eval "$(rbenv init -)" 
fi

if [[ $(uname -a ) == *"WSL"* ]]; then
  export TMUX_TMPDIR="/tmp"
fi

alias dots='git --git-dir=$HOME/.dots/ --work-tree=$HOME'

bindkey -s ^f "$HOME/.local/bin/tmux-sessionizer\n"

export PATH=$PATH:$HOME/.composer/vendor/bin
export PATH=$PATH:$HOME/.local/flutter/bin
export PATH=$PATH:$HOME/go/bin
