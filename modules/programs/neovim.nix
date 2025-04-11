{ config, lib, pkgs, ... }:

let
  neovimConfigDir = ../../../config/neovim;
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}
