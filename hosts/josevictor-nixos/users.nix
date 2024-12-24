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
        alacritty
        tmux
        xsel

        # apps
        nordpass
        brave
      ];
    };
    
    defaultUserShell = pkgs.zsh;
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
        deps = [];
      };

		alacrittyConfig = {
			text = ''
        runuser -l ${username} -c '
          ALACRITTY_CONFIG_PATH="$HOME/.config/alacritty"

          if [ ! -d "$ALACRITTY_CONFIG_PATH" ]; then
            ${pkgs.git}/bin/git clone https://github.com/josevictorferreira/.alacritty.git $ALACRITTY_CONFIG_PATH
          fi
        '
			'';
			deps = [];
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
  };
  
  environment.shells = with pkgs; [ zsh ];

  environment.systemPackages = with pkgs; [
    git
    fzf
    sqlite
    ripgrep
    gnumake
		openssh
    nodejs_22
  ]; 

  programs = {
  # Zsh configuration
	  zsh = {
    	enable = true;
	  	enableCompletion = true;
      ohMyZsh = {
        enable = true;
        plugins = ["git"];
        theme = "xiong-chiamiov-plus"; 
      };
      
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;

      
      promptInit = ''
          export LD_LIBRARY_PATH="${pkgs.sqlite.out}/lib/:$LD_LIBRARY_PATH"
          
          source <(fzf --zsh);
          HISTFILE=~/.zsh_history;
          HISTSIZE=10000;
          SAVEHIST=10000;
          setopt appendhistory;

          source $HOME/.config/.zshrc
        '';
      };
   };
}
