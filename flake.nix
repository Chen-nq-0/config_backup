{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    chaotic.url = "https://flakehub.com/f/chaotic-cx/nyx/*.tar.gz";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    umu = {
      url = "github:Open-Wine-Components/umu-launcher?dir=packaging/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri.url = "github:sodiboo/niri-flake";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      chaotic,
      zen-browser,
      noctalia,
      niri,
      umu,
      ...
    }:

    {
      nixosConfigurations = {
        Cat = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./system/system-config.nix
            chaotic.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.agonie = ./system/hm-nix/agonie.nix;
                backupFileExtension = "backup";
                extraSpecialArgs = {
                  inherit
                    inputs
                    niri
                    ;
                  system = "x86_64-linux";
                };
              };
            }
          ];
        };
      };
    };
}
