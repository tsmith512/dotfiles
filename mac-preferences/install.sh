#!/usr/bin/env bash

#                  __
#  _ __  _ __ ___ / _| ___ _ __ ___ _ __   ___ ___  ___
# | '_ \| '__/ _ \ |_ / _ \ '__/ _ \ '_ \ / __/ _ \/ __|
# | |_) | | |  __/  _|  __/ | |  __/ | | | (_|  __/\__ \
# | .__/|_|  \___|_|  \___|_|  \___|_| |_|\___\___||___/
# |_|
#
# okay so binary files kinda defeat the purpose here, but there are a couple
# .plist files that I wouldn't mind keeping around / backed up.

cd ${0%/*}

IFS=$(echo -en "\n\b")
for i in $(find * -name "*.plist"); do
  if [ -f "$HOME/Library/Preferences/$i" ]; then
    mv "$HOME/Library/Preferences/$i" "$HOME/Library/Preferences/$i.$(date +%Y%m%d-%H%M).backup"
  fi

  ln -s "$HOME/dotfiles/mac-preferences/$i" "$HOME/Library/Preferences/$i"
done
