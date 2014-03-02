#!/usr/bin/env bash
set -e

# Install MacVim
brew install macvim --override-system-vim

# Install Janus as Vim default
JANUS_INSTALL_DIR="$HOME/.vim"

if [ -d $JANUS_INSTALL_DIR ]
then
  echo 'janus already installed'
else
  echo 'install janus'
  curl -Lo- https://bit.ly/janus-bootstrap | bash
fi
