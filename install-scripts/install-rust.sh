#!/usr/bin/env bash
set -ue # exit after success
source $(dirname "${BASH_SOURCE[0]:-$0}")/utils.sh

function install_rust() {
  print_info "Download Rust"
  curl https://sh.rustup.rs -sSf | sh
  rustup override set stable
  rustup update stable
}

install_rust