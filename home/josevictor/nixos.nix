{ config, pkgs, username, lib, host, inputs, ... }:

{
  imports = [
    ./default.nix
    ./../modules/desktop/hyprland/hypr.nix
  ];

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
