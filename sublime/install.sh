#!/usr/bin/env bash

#              _      _  _                    _               _
#  ___  _   _ | |__  | |(_) _ __ ___    ___  | |_  ___ __  __| |_
# / __|| | | || '_ \ | || || '_ ` _ \  / _ \ | __|/ _ \\ \/ /| __|
# \__ \| |_| || |_) || || || | | | | ||  __/ | |_|  __/ >  < | |_
# |___/ \__,_||_.__/ |_||_||_| |_| |_| \___|  \__|\___|/_/\_\ \__|
#
# on mac os

cd ${0%/*}

IFS=$(echo -en "\n\b")
for i in $(find * -name "*.sublime-settings"); do
  if [ -f "$HOME/Library/Application Support/Sublime Text 2/Packages/User/$i" ]; then
    mv "$HOME/Library/Application Support/Sublime Text 2/Packages/User/$i" "$HOME/Library/Application Support/Sublime Text 2/Packages/User/$i.$(date +%Y%m%d-%H%M).backup"
  fi

  ln -s "$HOME/dotfiles/sublime/$i" "$HOME/Library/Application Support/Sublime Text 2/Packages/User/$i"
done
