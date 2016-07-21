#!/bin/bash

sudo apt-get install curl

# Install NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash


# Install RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
