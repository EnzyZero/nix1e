{
  pkgs,
  lib,
  config,
  ...
}:
let
  mkModule = import ./mkModule.nix {
    inherit pkgs lib;
    kernel = config.boot.kernelPackages.kernel;
  };
in
{
  boot = {
    extraModulePackages = [
      (mkModule "spi-hid" "4" ./spi-hid)
      (mkModule "surface-ec-restart" "1" ./surface-ec-restart)
    ];
    kernelModules = [ "surface-ec-restart" ];
  };
}
