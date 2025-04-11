{ config, lib, pkgs, ... }:

let
  ghosttyConfigDir = ./../../../config/ghostty;
in
{
  home.file = {
    ".config/ghostty".source = "${ghosttyConfigDir}";
  };

  home.packages = with pkgs; [
    ghostty
  ];
}
