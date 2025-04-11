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
    inputs@{ self, nixpkgs, nixpkgs-darwin, darwin, sops-nix, home-manager, ... }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      nixpkgsFor = forAllSystems (system:
        import nixpkgs {
          inherit system;
          config = { allowUnfree = true; };
        }
      );
      darwinPkgsFor = system: import nixpkgs-darwin {
        inherit system;
        config = { allowUnfree = true; };
      };
      system = "x86_64-linux";
      nixHost = "josevictor-nixos";
      macosHost = "josevictorferreira-macos";
      username = "josevictor";
      macosUsername = "josevictorferreira";
    in
    {
      nixosConfigurations = {
        "${nixHost}" = nixpkgs.lib.nixosSystem rec {
          specialArgs = {
            inherit system;
            inherit inputs;
            inherit username;
            host = nixHost;
            pkgs = nixpkgsFor.${system};
          };
          modules = [
            ./hosts/${nixHost}/config.nix
            inputs.distro-grub-themes.nixosModules.${system}.default
            sops-nix.nixosModules.sops

            # Add Home Manager as a NixOS module
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
              };
              home-manager.users.${username} = import ./home/${username}/nixos.nix;
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
            pkgs = darwinPkgsFor "aarch64-darwin";
          };
          modules = [
            ./hosts/${macosHost}/darwin.nix

            # Home Manager for macOS
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
              };
              home-manager.users.${macosUsername} = import ./home/${username}/macos.nix;
              home-manager.backupFileExtension = "backup";
            }
          ];
        };
      };
    };
}
