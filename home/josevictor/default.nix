{ config, pkgs, username, lib, host, inputs, ... }:

let
  inherit (import ../../hosts/${host}/variables.nix) gitUsername gitEmail keyboardLayout;
in
{
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";

    packages = with pkgs; [
      ghostty
      tmux
      gh
      insomnia
      awscli
      kubectl
      k9s
      kubernetes-helm
      helmfile
      beekeeper-studio
      nordpass
      brave
      htop-vim
      inetutils
    ];

    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "${gitUsername}";
    userEmail = "${gitEmail}";
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "docker" "kubectl" ];
      theme = "robbyrussell";
    };
    initExtra = ''
      eval "$(direnv hook zsh)"
      export LD_LIBRARY_PATH="${pkgs.sqlite.out}/lib/:$LD_LIBRARY_PATH"
      
      # Source your custom zsh config if it exists
      if [ -f "$HOME/.config/zsh/init.zsh" ]; then
        source $HOME/.config/zsh/init.zsh
      fi
    '';
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    xwayland.enable = true;
  };

  home.keyboard = {
    layout = "${keyboardLayout}";
  };

  nixpkgs.config.allowUnfree = true;

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
