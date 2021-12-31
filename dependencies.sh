#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
	brew install ripgrep
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	pacaur -S ripgrep
  pacaur -S lua-language-server-git
fi
