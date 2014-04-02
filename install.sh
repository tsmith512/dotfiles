#!/usr/bin/env bash

#   __                _  _
#  / _|  ___   _ __  | |(_) _ __   _   _ __  __
# | |_  / _ \ | '__| | || || '_ \ | | | |\ \/ /
# |  _|| (_) || |    | || || | | || |_| | >  <
# |_|   \___/ |_|    |_||_||_| |_| \__,_|/_/\_\
#
# focusing on terminal-only usage, especially over SSH.

echo -- Installing Bash Config
$(dirname $0)/bash/install.sh

echo -- Installing Gitconfig
$(dirname $0)/git/install.sh

echo -- Installing Byobu Settings
$(dirname $0)/byobu/install.sh
