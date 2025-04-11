{ config, lib, pkgs, ... }:

let
  neovimConfigDir = ./../../config/neovim;
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # extraConfig = builtins.readFile "${neovimConfigDir}/init.lua";

  home.file = {
    ".config/nvim".source = "${neovimConfigDir}";

    # ".config/nvim/lua".source = "${neovimConfigDir}/lua";
    # ".config/nvim/after".source = "${neovimConfigDir}/after";
    # ".config/nvim/schemas".source = "${neovimConfigDir}/schemas";
    # ".config/nvim/snippets".source = "${neovimConfigDir}/snippets";
  };

}
