{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    x1e-nixos.url = "./vendor/x1e-nixos";
    custom.url = "./vendor/pkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      x1e-nixos,
      custom,
    }:
    {
      nixosModules = {
        default = {
          imports = with self.nixosModules; [
            x1e-nixos.nixosModules.default
            kernel
            overlays
          ];
        };

        kernel = import ./kernel.nix (import nixpkgs { system = "aarch64-linux"; });

        overlays = {
          nixpkgs.overlays = [
            (import ./overlay.nix)
            custom.overlays.default
          ];
        };
      };
    };
}
