# My NixOS Config

My NixOS Workspace setup for my work desktop.

## Install Steps

### SSH

Add or create your `id_ed25519` ssh keys running:
```console
$ ssh-keygen
```

### SOPS config:

Create the sops, age key folder:
```console
$ mkdir -p ~/.config/sops/age
```

Convert your ssh private key to age key:
```console
$ nix-shell -p ssh-to-age --run "ssh-to-age -private-key -i ~/.ssh/id_ed25519 > ~/.config/sops/age/keys.txt"
```

Generate public key from ssh public key:
```console
$ nix-shell -p ssh-to-age --run "ssh-to-age < ~/.ssh/id_ed25519.pub"
```

## Aknowledgements
Based on [KooL's NixOS-Hyprland](https://github.com/JaKooLit/NixOS-Hyprland)
