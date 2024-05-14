#!/usr/bin/env bash

set -ue

source $(dirname "${BASH_SOURCE[0]:-$0}")/utils.sh

function install_JetBrainsMono() {
  print_info "Install JetBrainsMono..."
  pushd /tmp
  curl -fLo "JetBrainsMono.zip" https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
  unzip JetBrainsMono.zip -d JetBrainsMono
  fd -E '*NL*' 'JetBrainsMonoNerdFont-' JetBrainsMono |  xargs -I'{}' cp '{}' ~/Library/Fonts/
  # clean up
  rm -rf JetBrainsMono*
  popd
}

function install_MesloLGS() {
  print_info "Install MesloLGS NF..."
  pushd /tmp
  curl -fLo "Meslo.zip" https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Meslo.zip
  unzip Meslo.zip -d Meslo
  fd -E '*DZ*' 'Meslo LG S.*Complete.ttf$' Meslo | xargs -I'{}' cp '{}' ~/Library/Fonts/
  # clean up
  rm -rf Meslo*
  popd

  # pushd ~/Library/Fonts
  # curl -fLo "MesloLGS NF Regular.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
  # curl -fLo "MesloLGS NF Bold.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
  # curl -fLo "MesloLGS NF Italic.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
  # curl -fLo "MesloLGS NF Bold Italic.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
  # popd
}

function install_fonts() {
  read -p "Install MesloLGS font? (y/n)" -n 1;
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then  
    install_MesloLGS
  fi
  read -p "Install JetBrainsMono font? (y/n)" -n 1;
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then  
    install_JetBrainsMono
  fi
}

install_fonts



