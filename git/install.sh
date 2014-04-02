#!/usr/bin/env bash

#         _  _
#   __ _ (_)| |_
#  / _` || || __|
# | (_| || || |_
#  \__, ||_| \__|
#  |___/
#

cd ${0%/*}

for i in $(find * -not -name "*.sh"); do
  if [ -f ~/.$i ]; then
    mv ~/.$i ~/.$i.$(date +%Y%m%d-%H%M).backup
  fi

  ln -s ~/dotfiles/git/$i ~/.$i
done
