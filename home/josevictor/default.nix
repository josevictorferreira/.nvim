{ config, pkgs, username, lib, host, inputs, ... }:

let
  inherit (import ../../hosts/${host}/variables.nix) gitUsername gitEmail keyboardLayout;
in
{
  imports = [
    ./../modules/development/ghostty.nix
    ./../modules/development/zsh.nix
    ./../modules/development/neovim.nix
    ./../modules/development/tmux.nix
  ];

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";

    packages = with pkgs; [
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
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = "true";
    };
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

  home.keyboard = {
    layout = "${keyboardLayout}";
  };

  nixpkgs.config.allowUnfree = true;
}
