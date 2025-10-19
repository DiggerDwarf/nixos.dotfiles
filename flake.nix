{
    description = "Someone's NixOS configuration";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        nixpkgs-stable.url = "nixpkgs/nixos-25.11";
        home-manager.url = "github:nix-community/home-manager/master";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let 
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in {
        nixosConfigurations = {
            sillynix = nixpkgs.lib.nixosSystem {
                inherit system;
                modules = [
                    ./configuration.nix
                ];
            };
        };
        homeConfiguration = {
            someone = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                    ./home.nix
                ];
            };
        };
    };
}
