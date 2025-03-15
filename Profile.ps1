function gdvim {
  nvim --listen 127.0.0.1:6004
}

function dots {
  git --git-dir="$HOME\.dots\" --work-tree="$HOME" $args
}
