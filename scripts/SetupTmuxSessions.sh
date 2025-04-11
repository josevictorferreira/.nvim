#!/bin/bash

tmux new-session -d -s main -c "$HOME"
tmux new-session -d -s work -c "$HOME"
tmux new-session -d -s projects -c "$HOME"
