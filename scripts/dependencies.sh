#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
	brew install git ripgrep fzf
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	yay -Syy git ripgrep fzf
fi
