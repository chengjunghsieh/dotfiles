#!/bin/bash

set -ue

function install_astronvim() {
  echo "Install Astronvim.."
  echo "backup old nvim..." 
  [[ -d ~/.config/nvim ]] && mv ~/.config/nvim ~/.config/nvim.bak
  [[ -d ~/.local/share/nvim ]] && mv ~/.local/share/nvim ~/.local/share/nvim.bak
  
  git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim

  pip3 install --upgrade pynvim
}

install_astronvim
