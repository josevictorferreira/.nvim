{ config, username, configRoot, isDarwin, ... }:

let
  homeDirPrefix = if isDarwin then "/Users" else "/home";
in
{
  sops = {
    defaultSopsFile = "${configRoot}/secrets/secrets.enc.yaml";
    age.keyFile = "${homeDirPrefix}/${username}/.config/sops/age/keys.txt";
  };

  sops.secrets."anthropic_api_key" = {
    owner = config.users.users.${username}.name;
    mode = "0400";
  };
  sops.secrets."printer_username" = {
    owner = config.users.users.${username}.name;
    mode = "0400";
  };
  sops.secrets."printer_password" = {
    owner = config.users.users.${username}.name;
    mode = "0400";
  };
}
