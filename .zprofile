if [[ $(uname) == "Darwin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export PATH=$PATH:$HOME/.rbenv/bin
export PATH=$PATH:$HOME/.rbenv/shims
eval "$(rbenv init -)" 

alias dots='git --git-dir=$HOME/.dots/ --work-tree=$HOME'

export PATH=$PATH:$HOME/.composer/vendor/bin
export PATH=$PATH:$HOME/.local/flutter/bin
export PATH=$PATH:$HOME/go/bin


# Added by Toolbox App
export PATH="$PATH:/Users/treybastian/Library/Application Support/JetBrains/Toolbox/scripts"

