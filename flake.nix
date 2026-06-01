{
  inputs = {
    x1e-nixos.url = "./vendor/x1e-nixos";
    custom.url = "./vendor/pkgs";
  };

  outputs =
    {
      self,
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

        kernel = import ./kernel;

        overlays.nixpkgs.overlays = [
          (import ./overlay.nix)
          custom.overlays.default
        ];
      };
    };
}
