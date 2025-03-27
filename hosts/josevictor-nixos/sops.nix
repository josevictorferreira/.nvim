{ config, username, ... }:

{
  sops = {
    defaultSopsFile = ../../secrets/secrets.enc.yaml;
    age.keyFile = "/home/${username}/.config/sops/age/keys.txt";
  };

  sops.secrets."anthropic_api_key" = {
    owner = config.users.users.${username}.name;
    group = config.users.users.${username}.group;
    mode = "0400";
  };
  sops.secrets."printer_username" = {
    owner = config.users.users.${username}.name;
    group = config.users.users.${username}.group;
    mode = "0400";
  };
  sops.secrets."printer_password" = {
    owner = config.users.users.${username}.name;
    group = config.users.users.${username}.group;
    mode = "0400";
  };
}
