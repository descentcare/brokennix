{
    description = "My NixOS Flake";
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/release-24.11";
        # unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    outputs = { self, nixpkgs, /*unstable,*/ ... }@inputs: {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            # specialArgs = { ingerit inputs };
            modules = [
                ./configuration.nix
            ];
        };
    };
}
