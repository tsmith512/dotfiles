#!/usr/bin/env bash

#  _                    _
# | |__   _   _   ___  | |__   _   _
# | '_ \ | | | | / _ \ | '_ \ | | | |
# | |_) || |_| || (_) || |_) || |_| |
# |_.__/  \__, | \___/ |_.__/  \__,_|
#         |___/
#

cd ${0%/*}

for i in $(find * -not -name "*.sh"); do
  if [ -f ~/.byobu/$i ]; then
    mv ~/.byobu/$i ~/.byobu/$i.$(date +%Y%m%d-%H%M).backup
  fi

  ln -s ~/dotfiles/byobu/$i ~/.byobu/$i
done

byobu-select-backend screen
byobu-launcher-install
