#!/usr/bin/env bash

source $(dirname "${BASH_SOURCE[0]:-$0}")/utils.sh

function install_starship() {
  print_info "Install Starship"
  curl -sS https://starship.rs/install.sh | sh
}
install_starship
