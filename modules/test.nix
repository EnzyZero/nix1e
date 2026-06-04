let
  pkgs = import <nixpkgs> { };
  helpers = import ./helpers.nix {
    inherit pkgs;
    inherit (pkgs) lib;
    kernel = pkgs.linuxPackages_testing.kernel;
  };
in
import ./spi-hid helpers
