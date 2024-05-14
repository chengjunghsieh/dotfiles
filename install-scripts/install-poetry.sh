#!/usr/bin/env bash

function install_poetry {
  curl -sSL https://install.python-poetry.org | python3 -
}

install_poetry
