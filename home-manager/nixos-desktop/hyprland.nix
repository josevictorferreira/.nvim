{ pkgs, username, inputs, configRoot, ... }:

let
  hyprlandConfig = "${configRoot}/config/hypr";
  python-packages = pkgs.python3.withPackages (
    ps:
      with ps; [
        requests
        pyquery # needed for hyprland-dots Weather script
      ]
  );
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    xwayland.enable = true;
    extraConfig = builtins.readFile "${hyprlandConfig}/hyprland.conf";
  };
  home.file = {
    ".config/hypr" = {
      source = "${hyprlandConfig}";
      recursive = true;
    };
  };
  home.packages = with pkgs; [
    swww
    waybar
    rofi-wayland
    swaynotificationcenter
    grim
    slurp
    wlogout
    wl-clipboard
    hypridle
    hyprcursor
    pyprland
    wallust
    (ags.overrideAttrs (oldAttrs: {
      inherit (oldAttrs) pname;
      version = "1.8.2";
    }))
    brightnessctl # for brightness control
    cliphist
    eog
    gnome-system-monitor
    file-roller
    gtk-engine-murrine #for gtk themes
    hypridle # requires unstable channel
    inxi
    libsForQt5.qtstyleplugin-kvantum #kvantum
    networkmanagerapplet
    nwg-look # requires unstable channel
    nvtopPackages.full
    pamixer
    pavucontrol
    playerctl
    polkit_gnome
    libsForQt5.qt5ct
    qt6ct
    qt6.qtwayland
    qt6Packages.qtstyleplugin-kvantum #kvantum
    swappy
    yad
    yt-dlp
  ] ++ [
    python-packages
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    fira-code
    noto-fonts-cjk-sans
    jetbrains-mono
    font-awesome
    terminus_font
  ];

  programs = {
    waybar.enable = true;
    hyprlock.enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = false;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    configPackages = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal
    ];
  };

  services = {
    greetd = {
      enable = true;
      vt = 3;
      settings = {
        default_session = {
          user = username;
          command = "Hyprland";
        };
      };
    };
  };
}
