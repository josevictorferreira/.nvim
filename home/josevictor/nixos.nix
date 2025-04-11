{ config, pkgs, username, lib, host, inputs, ... }:

{
  imports = [
    ./default.nix
    ./../modules/desktop/hyprland/hypr.nix
  ];
}
