{ pkgs, configRoot, ... }:

let
  ghosttyConfigDir = "${configRoot}/config/ghostty";
in
{
  home = {
    file = {
      ".config/ghostty" = {
        source = "${ghosttyConfigDir}";
        recursive = true;
      };
    };
    packages = with pkgs; [
      ghostty
    ];
    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
  };
}
