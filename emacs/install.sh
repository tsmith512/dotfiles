#!/usr/bin/env bash

#   ___ _ __ ___   __ _  ___ ___
#  / _ \ '_ ` _ \ / _` |/ __/ __|
# |  __/ | | | | | (_| | (__\__ \
#  \___|_| |_| |_|\__,_|\___|___/
#

cd ${0%/*}

files=(emacs emacs.d)

for i in "${files[@]}"; do
  if [ -e ~/.$i ]; then
    mv ~/.$i ~/.$i.$(date +%Y%m%d-%H%M).backup
  fi

  ln -s ~/dotfiles/emacs/$i ~/.$i
done
