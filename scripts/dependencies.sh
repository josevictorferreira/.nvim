#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
	brew install git ripgrep fzf
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	paru -Syy git ripgrep fzf jdk18-openjdk
fi
