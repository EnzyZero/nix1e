{
  inputs.pkgs.url = "./vendor/pkgs";
  outputs = { self, pkgs }: {
    nixosModules = {
      default = { ... }: {
        imports = with self.nixosModules; [
          overlays
        ];
      };

      overlays = import ./overlays.nix { inherit pkgs; };
    };
  };
}
