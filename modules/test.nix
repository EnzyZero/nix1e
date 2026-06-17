let
  pkgs = import <nixpkgs> { };
  kernel = pkgs.linuxPackages_testing.kernel;
  mkModule = import ./mkModule.nix {
    inherit pkgs kernel;
    inherit (pkgs) lib;
  };
in
mkModule "spi-hid" "4" ./spi-hid
