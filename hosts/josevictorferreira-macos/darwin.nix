{ pkgs, lib, username, host, ... }:

let
  inherit (import ./variables.nix) gitUsername;
in
{
  networking.hostName = "${host}";
  networking.computerName = "${host}";
  networking.localHostName = "${host}";

  system.defaults = {
    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
      FXEnableExtensionChangeWarning = false;
    };
    dock = {
      autohide = true;
      orientation = "bottom";
      show-recents = false;
      tilesize = 48;
    };
    NSGlobalDomain = {
      AppleShowAllExtensions = true;
      "com.apple.swipescrolldirection" = false;
      "com.apple.sound.beep.feedback" = 0;
      NSNavPanelExpandedStateForSaveMode = true;
      NSNavPanelExpandedStateForSaveMode2 = true;
    };
    loginwindow = {
      GuestEnabled = false;
    };
    # Trackpad settings
    trackpad = {
      Clicking = true;
      TrackpadRightClick = true;
    };
    # Enable key repeat
    NSGlobalDomain.ApplePressAndHoldEnabled = false;
  };

  environment.shells = with pkgs; [ zsh bash ];

  environment.systemPackages = with pkgs; [
    coreutils
    curl
    wget
    git
    gnupg
    vim
    openssh

    fzf
    ripgrep
    sqlite

    m-cli
    mas
  ];

  programs.zsh.enable = true;

  fonts.packages = with pkgs; [
    noto-fonts
    jetbrains-mono
    font-awesome
    nerd-fonts.jetbrains-mono
    nerd-fonts.droid-sans-mono
  ];

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };

  users.users.${username} = {
    name = username;
    home = "/Users/${username}";
    shell = pkgs.zsh;
  };

  nix.enable = true;

  nix.package = pkgs.nix;

  nix.optimise.automatic = true;

  nix.settings = {
    experimental-features = "nix-command flakes";
    substituters = [
      "https://cache.nixos.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
    trusted-users = [ "root" username ];
  };

  nix.gc = {
    automatic = true;
    interval = { Day = 7; };
    options = "--delete-older-than 14d";
  };

  system.stateVersion = 4;
}
