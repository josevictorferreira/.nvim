#!/usr/bin/env bash

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

if [ "$(uname)" == "Darwin" ]; then
	brew install ripgrep
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	pacaur -S ripgrep
  pacaur -S lua-language-server-git
  pacaur -S volar-server
  pacaur -S efm-langserver
  pacaur -S bash-language-server
  pacaur -S gopls
fi
