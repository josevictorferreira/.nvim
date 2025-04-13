{ pkgs, username, ... }:

let
  inherit (import ./variables.nix) gitUsername;
in
{
  imports = [
    ../shared/default.nix
    ../shared/ghostty.nix
    ./hyprland.nix
  ];

  users = {
    users."${username}" = {
      homeMode = "755";
      isNormalUser = true;
      description = "${gitUsername}";
      extraGroups = [
        "networkmanager"
        "wheel"
        "libvirtd"
        "scanner"
        "lp"
        "video"
        "input"
        "audio"
      ];
      packages = [ ]; # Packages handled by Home Manager
    };

    defaultUserShell = pkgs.zsh;
  };

  environment = {
    shells = with pkgs; [ zsh ];
    systemPackages = with pkgs; [
      # System Tools
      easyeffects
      gparted
      p7zip

      # Gaming
      lutris
      protonup
      wine64
      winetricks
      wine-wayland
    ];
    sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "$HOME/.steam/root/compatibilitytools.d";
    };
  };

  programs.zsh = {
    enable = true;
    promptInit = "";
  };

  fileSystems."/home/${username}/shared_storage" = {
    device = "10.10.10.200:/mnt/shared_storage_1";
    fsType = "nfs";
    options = [ "rw" "soft" "noatime" "actimeo=60" "vers=3" "x-systemd.automount" ];
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  system.activationScripts = { };
}
