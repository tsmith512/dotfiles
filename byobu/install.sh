#!/usr/bin/env bash

cd ${0%/*}

for i in $(find * -not -name "*.sh"); do
  if [ -f ~/.byobu/$i ]; then
    mv ~/.byobu/$i ~/.byobu/$i.$(date +%Y%m%d-%H%M).backup
  fi

  ln -s ~/dotfiles/byobu/$i ~/.byobu/$i
done
