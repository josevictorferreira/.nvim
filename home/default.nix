{ pkgs, username, host, isDarwin, ... }:
let
  homeDirPrefix = if isDarwin then "/Users" else "/home";
  inherit (import ../../hosts/${host}/variables.nix) gitUsername gitEmail keyboardLayout;
in
{
  imports = [
    ./../modules/development/zsh.nix
    ./../modules/development/neovim.nix
    ./../modules/development/tmux.nix
  ];

  home = {
    username = "${username}";
    homeDirectory = "${homeDirPrefix}/${username}";

    packages = with pkgs; [
      gh
      insomnia
      awscli
      kubectl
      k9s
      kubernetes-helm
      helmfile
      brave
      htop-vim
      inetutils
      eza
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

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.keyboard = {
    layout = "${keyboardLayout}";
  };

  nixpkgs.config.allowUnfree = true;
}
