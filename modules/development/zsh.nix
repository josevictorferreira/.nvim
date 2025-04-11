{ configRoot, ... }:

let
  zshConfigDir = "${configRoot}/config/zsh";
in
{
  programs.zsh = {
    enable = true;
    initExtra = ''
      source ${zshConfigDir}/init.zsh
    '';
  };

  home.file = {
    ".config/zsh".source = "${zshConfigDir}";
  };
}
