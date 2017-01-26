#!/usr/bin/env bash

#  _                 _
# | |__   __ _  ___ | |__
# | '_ \ / _` |/ __|| '_ \
# | |_) | (_| |\__ \| | | |
# |_.__/ \__,_||___/|_| |_|
#

cd ${0%/*}

# There's gotta be a better way to do this, but bash would not
# follow symlinks or allow for the "~" alias when sourcing the
# config, so we're chaining scripts together here

DIRNAME=$(pwd)
HOMEDIR=$(cd && pwd)

echo "" >> $DIRNAME/.bashrc
echo "source $DIRNAME/bashrc" >> $HOMEDIR/.bashrc
echo "" >> $DIRNAME/.bashrc
