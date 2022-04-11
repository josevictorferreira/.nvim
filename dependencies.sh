#!/usr/bin/env bash

pip install neovim

if [ "$(uname)" == "Darwin" ]; then
	brew install ripgrep
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	pacaur -S ripgrep
  pacaur -S lua-language-server-git
  pacaur -S volar-server
  pacaur -S efm-langserver
  pacaur -S bash-language-server
fi
