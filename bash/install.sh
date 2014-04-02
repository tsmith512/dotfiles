#!/usr/bin/env bash

cd ${0%/*}

if [ ! -f ~/bin/vcprompt ]; then
  echo -- -- Downloading Version Control Prompt
  mkdir -p ~/bin
  curl -Lo ~/bin/vcprompt https://github.com/djl/vcprompt/raw/master/bin/vcprompt
  chmod 755 ~/bin/vcprompt
fi

for i in $(find * -not -name "*.sh"); do
  if [ -f ~/.$i ]; then
    mv ~/.$i ~/.$i.$(date +%Y%m%d-%H%M).backup
  fi

  ln -s ~/dotfiles/bash/$i ~/.$i
done
