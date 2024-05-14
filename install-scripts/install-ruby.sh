#!/bin/bash
set -ue

brew install rbenv ruby-build

echo 'eval "$(rbenv init - zsh)"' >> ${ZDOTDIR}/.zshrc

# check rbenv
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-doctor | bash

rbenv install 2.7.6
rbenv global 2.7.6
# # list latest stable versions:
# echo 'use `rbenv install -l` to list latest stable versions'

# # list all local versions:
# echo 'use `rbenv install -L` to list all local versions'

# # install a Ruby version:
# echo 'Install a Ruby version `rbenv install 2.0.0-p247`'


# echo 'Set a Ruby version to finish installation and start using commands `rbenv global 2.0.0-p247` or `rbenv local 2.0.0-p247`'

# echo 'see more information: https://github.com/rbenv/rbenv'
