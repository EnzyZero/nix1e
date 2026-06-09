{
  inputs = {
    x1e-nixos.url = "./vendor/x1e-nixos";
    custom.url = "./vendor/pkgs";
  };

  outputs =
    {
      x1e-nixos,
      custom,
      ...
    }:
    {
      nixosModules = {
        default = {
          imports = [
            x1e-nixos.nixosModules.default
            { nixpkgs.overlays = [ custom.overlays.default ]; }
            ./.
          ];
        };
      };
    };
}
