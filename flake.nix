{
  description = "KooL's NixOS-Hyprland";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    distro-grub-themes.url = "github:AdisonCavani/distro-grub-themes";
    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs =
    inputs@{ self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      host = "josevictor-nixos";
      username = "josevictor";

      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations = {
        "${host}" = nixpkgs.lib.nixosSystem rec {
          specialArgs = {
            inherit system;
            inherit inputs;
            inherit username;
            inherit host;
          };
          modules = [
            ./hosts/${host}/config.nix
            inputs.distro-grub-themes.nixosModules.${system}.default
            inputs.sops-nix.nixosModules.sops
          ];
        };
      };
    };
}

