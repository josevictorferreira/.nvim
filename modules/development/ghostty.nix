{ pkgs, configRoot, ... }:

let
  ghosttyConfigDir = "${configRoot}/config/ghostty";
in
{
  home.file = {
    ".config/ghostty".source = "${ghosttyConfigDir}";
  };

  home.packages = with pkgs; [
    ghostty
  ];
}
