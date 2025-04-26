if [[ $(uname) == "Darwin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export ANTHROPIC_API_KEY=$(security find-generic-password -a "$USER" -s "ANTHROPIC_API_KEY" -w)
fi

alias dots='git --git-dir=$HOME/.dots/ --work-tree=$HOME'
alias vim='nvim'
alias gdvim='nvim --listen /tmp/godot.pipe'

# Created by `pipx` on 2025-04-13 09:41:06
export PATH="$PATH:/Users/trey/.local/bin"
