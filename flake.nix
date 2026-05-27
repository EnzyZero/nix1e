{
  inputs = {
    x1e-nixos.url = "./vendor/x1e-nixos";
    pkgs.url = "./vendor/pkgs";
  };

  outputs = { self, x1e-nixos, pkgs }: {
    nixosModules = {
      default = { ... }: {
        imports = with self.nixosModules; [
          x1e-nixos.nixosModules.default
          overlays
        ];
      };

      overlays = import ./overlays.nix { inherit pkgs; };
    };
  };
}
