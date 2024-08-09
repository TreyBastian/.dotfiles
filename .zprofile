if [[ $(uname) == "Darwin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

alias dots='git --git-dir=$HOME/.dots/ --work-tree=$HOME'

if [ "$ALACRITTY" = true ]; then
  theme() {
    ln -sf $HOME/.config/alacritty/$1.toml $HOME/.config/alacritty/_active.toml
    touch $HOME/.config/alacritty/alacritty.toml
  }
  alias dark_mode='ln -sf $HOME/.config/alacritty/zenbones_dark.toml \
    $HOME/.config/alacritty/_active.toml \
    && touch $HOME/.config/alacritty/alacritty.toml'
  alias light_mode='ln -sf $HOME/.config/alacritty/zenbones_light.toml \
    $HOME/.config/alacritty/_active.toml \
    && touch $HOME/.config/alacritty/alacritty.toml'
  local ALACRITTY_THEME="Dark" # default dark
  if [[ $(uname) == "Darwin" ]]; then
    ALACRITTY_THEME=$(defaults read -g AppleInterfaceStyle 2>/dev/null || echo "Light")
  fi
  if [ "$ALACRITTY_THEME" = "Dark" ]; then
    theme "zenbones_dark"   
  else
   theme "zenbones_light" 
  fi
fi

bindkey -s ^f "$HOME/.local/bin/tmux-sessionizer\n"

export PATH=$PATH:$HOME/.composer/vendor/bin
export PATH=$PATH:$HOME/.local/flutter/bin
