#!/usr/bin/env bash

set -ue

source $(dirname "${BASH_SOURCE[0]:-$0}")/utils.sh

# [Migration from `npm` to  `pnpm`](https://dev.to/andreychernykh/yarn-npm-to-pnpm-migration-guide-2n04)
# [`pnpm` replace `yarn`, `npm`, `nvm`](https://juejin.cn/post/7077760907782127647)
# https://pnpm.io/installation
function install_pnpm() {
  print_info "Install pnpm"
  curl -fsSL https://get.pnpm.io/install.sh | sh -
}

install_pnpm