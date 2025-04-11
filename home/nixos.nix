{ ... }:

{
  imports = [
    ./default.nix
    ./../modules/desktop/hyprland.nix
    ./../modules/development/ghostty.nix
  ];

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
