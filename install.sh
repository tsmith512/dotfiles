#!/usr/bin/env bash

echo -- Installing Gitconfig
$(dirname $0)/git/install.sh

echo -- Installing Byobu Settings
$(dirname $0)/byobu/install.sh
