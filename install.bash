#!/bin/bash

# Install packer
echo "Begin installing packer"
if [ ! d ~/.local/share/nvim/site/pack/packer ]; then
  echo "Installing packer"
  git clone https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
  echo
  echo "Packer installed!"
  echo
fi
./lazygit
./ranger
./zsh
