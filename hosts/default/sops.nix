{ config, username, ... }:

{
  sops = {
    defaultSopsFile = ./secrets/secrets.enc.yaml;
    age.keyFile = "/home/${username}/.config/sops/age/keys.txt";
  };
}
