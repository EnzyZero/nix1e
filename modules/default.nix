{
  pkgs,
  lib,
  config,
  ...
}:
let
  helpers = import ./helpers.nix {
    inherit pkgs lib;
    kernel = config.boot.kernelPackages.kernel;
  };

  spiHid = import ./spi-hid helpers;
  ecRestart = import ./surface-ec-restart helpers;
in
{
  boot = {
    extraModulePackages = [
      spiHid
      ecRestart
    ];
    kernelModules = [ "surface-ec-restart" ];
  };
}
