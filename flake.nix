{
    description = "My NixOS Flake";
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs";
    };
    outputs = { self, nixpkgs, ... }@inputs: {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./configuration.nix
            ];
        };
    };
}
