{ pkgs, configRoot, ... }:

let
  neovimConfigDir = "${configRoot}/config/neovim";
  sharedLibExt = pkgs.stdenv.hostPlatform.extensions.sharedLibrary;
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    plugins = [
      pkgs.sqlite
      {
        plugin = pkgs.vimPlugins.sqlite-lua;
        config = "let g:sqlite_clib_path = '${pkgs.sqlite.out}/lib/libsqlite3${sharedLibExt}'";
      }
    ];
    extraLuaConfig = builtins.readFile "${neovimConfigDir}/init.lua";
  };

  home.file = {
    ".config/nvim/lua" =
      {
        source = "${neovimConfigDir}/lua";
        recursive = true;
        executable = false;
      };
    ".config/nvim/schemas" =
      {
        source = "${neovimConfigDir}/schemas";
        recursive = true;
        executable = false;
      };
    ".config/nvim/after" =
      {
        source = "${neovimConfigDir}/after";
        recursive = true;
        executable = false;
      };
    ".config/nvim/snippets" =
      {
        source = "${neovimConfigDir}/snippets";
        recursive = true;
        executable = false;
      };
  };
}
