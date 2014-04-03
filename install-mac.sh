#!/usr/bin/env bash

#   __
#  / _| ___  _ __   _ __ ___   __ _  ___    ___  ___
# | |_ / _ \| '__| | '_ ` _ \ / _` |/ __|  / _ \/ __|
# |  _| (_) | |    | | | | | | (_| | (__  | (_) \__ \
# |_|  \___/|_|    |_| |_| |_|\__,_|\___|  \___/|___/
#

echo -- Installing Bash Config
$(dirname $0)/bash/install.sh

echo -- Installing Gitconfig
$(dirname $0)/git/install.sh

echo -- Installing Sublime Text Preferences
$(dirname $0)/sublime/install.sh
