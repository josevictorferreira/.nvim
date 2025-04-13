{ pkgs, configRoot, ... }:
{
  services = {
    printing = {
      enable = true;
      drivers = [
        (pkgs.linkFarm "drivers" [
          {
            name = "share/cups/model/HP-LaserJet_1020.ppd";
            path = "${configRoot}/config/HP1020/HP-LaserJet_1020.ppd";
          }
        ])
        pkgs.foo2zjs
      ];
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
      openFirewall = true;
      settings = {
        global = {
          "client min protocol" = "SMB2";
          "client max protocol" = "SMB3";
          "securityType" = "user";
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

