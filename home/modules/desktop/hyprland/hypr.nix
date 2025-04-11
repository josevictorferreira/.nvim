{ config, lib, pkgs, ... }:

let
  hyprlandConfig = ./../../../../config/hypr;
in
{
  home.file = {
    ".config/hypr".source = "${hyprlandConfig}";
  };
}
