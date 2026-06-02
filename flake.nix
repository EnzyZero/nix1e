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
            overlay
          ];
        };

        kernel = import ./kernel;
        overlay.nixpkgs.overlays = [
          (import ./overlay)
          custom.overlays.default
        ];
      };
    };
}
