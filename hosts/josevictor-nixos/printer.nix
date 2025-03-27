{ lib, pkgs, config, username, ... }:
{
  services = {
    printing = {
      enable = true;
      drivers = [
        (pkgs.linkFarm "drivers" [
          {
            name = "share/cups/model/HP-LaserJet_1020.ppd";
            path = ./../../drivers/HP-LaserJet_1020.ppd;
          }
        ])
        pkgs.foo2zjs
      ];
      # drivers = [
      #   pkgs.foo2zjs
      #   pkgs.linkFarm
      #   "drivers"
      #   [
      #     {
      #       name = "share/cups/model/HP-LaserJet_1020.ppd";
      #       path = "./drivers/HP-LaserJet_1020.ppd";
      #     }
      #   ]
      # ];
      extraConf = ''
        FileDevice Yes

        <Location >
          Order allow,deny
          Allow localhost
        </Location>

        <Location /admin>
          Order allow,deny
          Allow localhost
        </Location>
      '';
    };

    samba = {
      enable = true;
      securityType = "user";
      openFirewall = true;
      settings = {
        global = {
          "client min protocol" = "SMB2";
          "client max protocol" = "SMB3";
          "username" = "${builtins.readFile config.sops.secrets."printer_username".path}";
          "password" = "${builtins.readFile config.sops.secrets."printer_password".path}";
        };
      };
    };
  };

  hardware = {
    printers = {
      ensurePrinters = [
        {
          name = "HP_LaserJet_1020";
          location = "Home";
          deviceUri = "smb://10.10.10.5/HP1020";
          model = "HP-LaserJet_1020.ppd";
          ppdOptions = {
            PageSize = "A4";
          };
        }
      ];
      ensureDefaultPrinter = "HP_LaserJet_1020";
    };
  };
}

