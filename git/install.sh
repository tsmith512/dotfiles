#!/usr/bin/env bash

cd ${0%/*}

for i in $(find * -not -name "*.sh"); do
  if [ -f ~/.$i ]; then
    mv ~/.$i ~/.$i.$(date +%Y%m%d-%H%M).backup
  fi

  ln -s ~/dotfiles/git/$i ~/.$i
done
