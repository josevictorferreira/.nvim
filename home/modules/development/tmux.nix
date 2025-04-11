{ config, lib, pkgs, ... }:

let
  tmuxConfigDir = ./../../../config/tmux;
in
{
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile "${tmuxConfigDir}/tmux.conf";
    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
    ];
    terminal = "tmux-256color";
    escapeTime = 10;
    historyLimit = 10000;
  };
  home.file = {
    ".config/tmux".source = "${tmuxConfigDir}";
  };
}
