{ pkgs, username, host, isDarwin, ... }:
let
  homeDirPrefix = if isDarwin then "/Users" else "/home";
  inherit (import ./../hosts/${host}/variables.nix) gitUsername gitEmail keyboardLayout;
in
{
  imports = [
    ./zsh.nix
    ./neovim.nix
    ./tmux.nix
  ];

  home = {
    username = "${username}";
    homeDirectory = "${homeDirPrefix}/${username}";

    packages = with pkgs; [
      # Desktop tools
      brave
      vlc

      # Dev tools
      curl
      git
      gnupg
      gnumake
      coreutils
      insomnia
      gh
      awscli
      kubectl
      k9s
      kubernetes-helm
      helmfile
      htop-vim
      inetutils
      eza
      fzf
      ripgrep
      vim
      openssl
      openssh
      wget
      nmap
      arp-scan
      tree
      direnv
      clang
      xsel
      sops
      age
      unzip
      imagemagick
      btop
      fastfetch
      ffmpeg
    ];

    stateVersion = "24.05";
  };

  keyboard = {
    layout = "${keyboardLayout}";
  };

  programs = {
    home-manager = {
      enable = true;
    };
    git = {
      enable = true;
      userName = "${gitUsername}";
      userEmail = "${gitEmail}";
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = "true";
      };
    };
    direnv = {
      enable = true;
      promptMode = "nix";
      nix-direnv = {
        enable = true;
      };
    };
  };

  virtualisation.libvirtd.enable = true;
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };
}
