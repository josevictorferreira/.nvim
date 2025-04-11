{ config, pkgs, lib, ... }:

{
  imports = [
    ./default.nix

    ../modules/desktop/macos
  ];

  home.packages = with pkgs; [
    iterm2
    mas
  ];

  targets.darwin = {
    search = "Search";
    defaults = {
      NSGlobalDomain = {
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
        AppleKeyboardUIMode = 3;
        AppleShowAllExtensions = true;
        AppleShowScrollBars = "Always";
      };
      dock = {
        autohide = true;
        orientation = "bottom";
        showhidden = true;
      };
      finder = {
        AppleShowAllExtensions = true;
        ShowPathbar = true;
        ShowStatusBar = true;
      };
    };
  };
}
