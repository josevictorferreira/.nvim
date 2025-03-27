{ pkgs, config, username, ... }:
{
  services =
    {
      printing = {
        enable = true;
        drivers = [
          pkgs.foo2zjs
        ];
        extraConf = ''
          FileDevice Yes
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
          };
        };
      };
    };

  hardware.printers = {
    ensurePrinters = [
      {
        name = "HP_LaserJet_1020";
        location = "Home";
        deviceUri = config.sops.secrets.printer_address.path;
        model = "/home/${username}/.config/nix/drivers/HP-LaserJet_1020.ppd";
        ppdOptions = {
          PageSize = "A4";
        };
      }
    ];
    ensureDefaultPrinter = "HP_LaserJet_1020";
  };
}
