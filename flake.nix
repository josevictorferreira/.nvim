{
  description = "JoseVictor NixOS-Hyprland";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-darwin.url = "nixpkgs/nixpkgs-unstable";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    distro-grub-themes.url = "github:AdisonCavani/distro-grub-themes";
    sops-nix.url = "github:Mic92/sops-nix";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ nixpkgs, darwin, sops-nix, home-manager, ... }:
    let
      system = "x86_64-linux";
      nixHost = "josevictor-nixos";
      macosHost = "josevictorferreira-macos";
      username = "josevictor";
      macosUsername = "josevictorferreira";
    in
    {
      nixosConfigurations = {
        "${nixHost}" = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system;
            inherit inputs;
            inherit username;
            host = nixHost;
            configRoot = ./.;
            isDarwin = false;
            isNixOS = true;
          };
          modules = [
            ./hosts/${nixHost}/config.nix
            inputs.distro-grub-themes.nixosModules.${system}.default
            sops-nix.nixosModules.sops

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit system;
                inherit inputs;
                inherit username;
                host = nixHost;
                isNixOS = true;
                isDarwin = false;
                configRoot = ./.;
              };
              home-manager.users.${username} = import ./home/nixos.nix;
              home-manager.backupFileExtension = "backup";
            }
          ];
        };
      };

      darwinConfigurations = {
        "${macosHost}" = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = {
            inherit inputs;
            username = macosUsername;
            host = macosHost;
            configRoot = ./.;
            isDarwin = true;
            isNixOS = false;
          };
          modules = [
            ./hosts/${macosHost}/darwin.nix

            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit inputs;
                username = macosUsername;
                host = macosHost;
                isNixOS = false;
                isDarwin = true;
                configRoot = ./.;
              };
              home-manager.users.${macosUsername} = import ./home/macos.nix;
              home-manager.backupFileExtension = "backup";
            }
          ];
        };
      };
    };
}
