#!/bin/bash

git clone --bare git@github.com:TreyBastian/.dotfiles.git $HOME/.dots
function dots {
   git --git-dir=$HOME/.dots/ --work-tree=$HOME $@
}
dots checkout
if [ $? = 0 ]; then
  echo "Checked out Treys dotfiles.";
  else
    echo "Backing up pre-existing dotfiles.";
    mkdir -p .dots-backup
    dots checkout 2>&1 | \
      egrep "\s+\." | \
      awk {'print $1'} | \
      xargs -I{} mv {} .dots-backup/{}
fi;
dots checkout
dots config status.showUntrackedFiles no
