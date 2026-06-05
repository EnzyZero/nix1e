{
  description = "Surface Laptop 7 (x1e80100 / Snapdragon X Elite) kernel and hardware support";

  outputs =
    { self }:
    {
      nixosModules = {
        default = self.nixosModules.all;

        all =
          { ... }:
          {
            imports = with self.nixosModules; [
              kernel-modules
              hardware
            ];
          };

        kernel-modules = import ./kernel-modules.nix;
        hardware = import ./hardware.nix;
      };
    };
}
