#!/usr/bin/env bash

#   __
#  / _| ___  _ __   _ __ ___   __ _  ___    ___  ___
# | |_ / _ \| '__| | '_ ` _ \ / _` |/ __|  / _ \/ __|
# |  _| (_) | |    | | | | | | (_| | (__  | (_) \__ \
# |_|  \___/|_|    |_| |_| |_|\__,_|\___|  \___/|___/
#

echo -- Setting up Finder / Mac OS defaults

echo -- -- OSX: Reduce font smoothing
defaults -currentHost write -globalDomain AppleFontSmoothing -int 1

echo -- -- OSX: Expand Save dialog boxes
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo -- -- OSX: Expand Print dialog boxes
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

echo -- -- OSX: Remove margin/shadow on window captures
defaults write com.apple.screencapture disable-shadow -bool true

echo -- -- OSX: Key Repeat on press-and-hold
defaults write -g ApplePressAndHoldEnabled -bool false

echo -- -- Finder: Show hidden files
defaults write com.apple.finder AppleShowAllFiles TRUE

echo -- -- Finder: Show full window path
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES

echo -- Installing Bash Config
$(dirname $0)/bash/install.sh

echo -- Installing Gitconfig
$(dirname $0)/git/install.sh

echo -- Installing Sublime Text Preferences
$(dirname $0)/sublime/install.sh

echo -- Installing Additional Preferences files
$(dirname $0)/mac-preferences/install.sh