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
      ];

      # define user packages here
      packages = with pkgs; [
        # neovim dependencies
        neovim

        # development
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

        # apps
        nordpass
        brave
        htop-vim
        weechat
        weechatScripts.wee-slack
        grim
        sway-contrib.grimshot
        flameshot
        (flameshot.override { enableWlrSupport = true; })
      ];
    };

    defaultUserShell = pkgs.zsh;
  };

  virtualisation.docker = {
    enable = true;
  };

  users.extraGroups.docker.members = [ "${username}" ];

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
    python311
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
      promptInit = ''
        eval "$(direnv hook zsh)"

        export LD_LIBRARY_PATH="${pkgs.sqlite.out}/lib/:$LD_LIBRARY_PATH"

        source $HOME/.config/zsh/init.zsh
      '';
    };
  };

  fileSystems."/home/${username}/shared_storage" = {
    device = "10.10.10.200:/mnt/shared_storage_1";
    fsType = "nfs";
    options = [ "rw" "soft" "noatime" "actimeo=60" "vers=3" "x-systemd.automount" ];
  };

  system.activationScripts = {
    tmuxPluginManager = {
      text = ''
        runuser -l ${username} -c '
          TMUX_CONFIG_PATH="$HOME/.config/tmux"

          if [ ! -d "$TMUX_CONFIG_PATH" ]; then
            ${pkgs.git}/bin/git clone https://github.com/josevictorferreira/.tmux.git $TMUX_CONFIG_PATH
          fi

          TPM_PATH="$HOME/.config/tmux/plugins/tpm"
          TMUX_PLUGINS_PATH="$HOME/.config/tmux/plugins"
          if [ ! -d "$TPM_PATH" ]; then
            mkdir -p $TMUX_PLUGINS_PATH
            ${pkgs.git}/bin/git clone https://github.com/tmux-plugins/tpm $TPM_PATH
          fi
        '
      '';
      deps = [ ];
    };

    zshConfig = {
      text = ''
        runuser -l ${username} -c '
          ZSH_CONFIG_PATH="$HOME/.config/zsh"

          if [ ! -d "$ZSH_CONFIG_PATH" ]; then
            ${pkgs.git}/bin/git clone https://github.com/josevictorferreira/.zsh.git $ZSH_CONFIG_PATH

            touch $ZSH_CONFIG_PATH/secrets.zsh
          fi
        '
      '';
    };

    ghosttyConfig = {
      text = ''
        runuser -l ${username} -c '
          GHOSTTY_CONFIG_PATH="$HOME/.config/ghostty"

          if [ ! -d "$GHOSTTY_CONFIG_PATH/.git" ]; then
            rm -r $GHOSTTY_CONFIG_PATH
            ${pkgs.git}/bin/git clone https://github.com/josevictorferreira/.ghostty.git
          fi
        '
      '';
    };

    wspcConfig = {
      text = ''
        runuser -l ${username} -c '
          if [ ! -d "$HOME/Workspace" ]; then
            mkdir -p $HOME/Workspace
          fi
        '
      '';
    };
  };
}
