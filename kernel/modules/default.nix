{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.nix1e;

  helpers = import ./helpers.nix {
    inherit pkgs lib;
    kernel = config.boot.kernelPackages.kernel;
  };

  spiHid = import ./spi-hid helpers;
  ecRestart = import ./surface-ec-restart helpers;
in
{
  options.nix1e = {
    ecRestart = lib.mkEnableOption "EC hard-reset reboot method";
  };

  config.boot = {
    extraModulePackages = [ spiHid ] ++ lib.optional cfg.ecRestart ecRestart;
    kernelModules = lib.optional cfg.ecRestart "surface-ec-restart";
  };
}
