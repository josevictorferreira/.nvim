{ pkgs, configRoot, ... }:

let
  neovimConfigDir = "${configRoot}/config/neovim";
  sharedLibExt = pkgs.stdenv.hostPlatform.extensions.sharedLibrary;
  sqliteLibPath = "${pkgs.sqlite}/lib/libsqlite3${sharedLibExt}";
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    plugins = [
      pkgs.sqlite
      pkgs.nodejs_22 # Unfortunately needed dependency for copilot neovim plugin
      pkgs.python311
      pkgs.luajit
      pkgs.nixd
      {
        plugin = pkgs.vimPlugins.sqlite-lua;
        config = "let g:sqlite_clib_path = '${sqliteLibPath}'";
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
