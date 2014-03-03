#!/usr/bin/env bash

DOTFILES_ROOT="`pwd`"

# Install Homebrew
if [ ! -d /usr/local/.git/ ]
then
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

# First off setups all the tools
for setup_script in `find $DOTFILES_ROOT -name setup.sh`
do
  $setup_script
done

for topical_folder in `find $DOTFILES_ROOT -type d -depth 1 ! -name '.git'`
do
  # Add symlinks to home for each topic
  for source in `find $topical_folder -name \*.ln`
  do
    ln -i -h -s $source ~/.`basename ${source%.*}`
  done

  # Add ZSH aliases and commands in oh-my-zsh custom folder
  for source in `find $topical_folder -name \*.zsh`
  do
    ln -i -s $source ~/.oh-my-zsh/custom/`basename $topical_folder`_`basename ${source%.*}`.zsh
  done
done

