{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.nix1e;
  kernel = config.boot.kernelPackages.kernel;

  build = "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build";
  mkModule =
    pname: version: src:
    pkgs.stdenv.mkDerivation {
      inherit pname src;
      version = "${version}-${kernel.version}";

      hardeningDisable = [ "pic" ];
      nativeBuildInputs = kernel.moduleBuildDependencies;

      buildPhase = "make -C ${build} M=$PWD modules";
      installPhase = "make -C ${build} M=$PWD modules_install INSTALL_MOD_PATH=$out";
    };

  ecRestart = mkModule "surface_ec_restart" "1.0.0" ./surface_ec_restart;
in
{
  options.nix1e = {
    ecRestart = lib.mkEnableOption "EC hard-reset reboot method";
  };

  config.boot = {
    extraModulePackages = lib.optional cfg.ecRestart ecRestart;
    kernelModules = lib.optional cfg.ecRestart "surface_ec_reboot";
  };
}
