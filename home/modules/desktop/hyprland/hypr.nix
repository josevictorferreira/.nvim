{ config, lib, pkgs, inputs, ... }:

let
  hyprlandConfig = ./../../../../config/hypr;
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    xwayland.enable = true;
    extraConfig = builtins.readFile "${hyprlandConfig}/hyprland.conf";
  };
  home.file = {
    ".config/hypr" = {
      source = "${hyprlandConfig}";
      recursive = true;
    };
  };
  home.packages = with pkgs; [
    swww
    waybar
    rofi-wayland
    swaynotificationcenter
    grim
    slurp
    wlogout
    wl-clipboard
    hypridle
    hyprcursor
    pyprland
    wallust
  ];
  programs = {
    waybar.enable = true;
    hyprlock.enable = true;
  };
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
