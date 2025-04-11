{ pkgs, username, ... }:

let
  inherit (import ./variables.nix) gitUsername;
in
{
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
        "docker"
      ];

      # User packages are now managed by Home Manager
      packages = [ ];
    };

    defaultUserShell = pkgs.zsh;
  };

  virtualisation.docker = {
    enable = true;
  };

  environment.shells = with pkgs; [ zsh ];

  environment.systemPackages = with pkgs; [
    git
    fzf
    sqlite
    clang
    gcc
    ripgrep
    gnumake
    openssh
    xsel
    nodejs_22
    go
    ruby
    cargo
    p7zip
    nixd
    protonup
    lutris
    docker_26
    docker-compose
    gparted
    direnv
    easyeffects
    wine64
    winetricks
    wine-wayland
    tree
    nmap
    arp-scan
    vlc
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "$HOME/.steam/root/compatibilitytools.d";
  };

  programs = {
    zsh = {
      enable = true;
      promptInit = "";
    };
  };

  fileSystems."/home/${username}/shared_storage" = {
    device = "10.10.10.200:/mnt/shared_storage_1";
    fsType = "nfs";
    options = [ "rw" "soft" "noatime" "actimeo=60" "vers=3" "x-systemd.automount" ];
  };

  system.activationScripts = { };
}
