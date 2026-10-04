{ pkgs, lib, ... }:
let
  files = import ./files.nix;

  # https://www.microsoft.com/en-us/download/details.aspx?id=106120
  romulus-firmware = pkgs.stdenv.mkDerivation rec {
    pname = "romulus-firmware";
    version = "26100_26.053.36539.0";
    src = pkgs.fetchurl {
      url = "https://download.microsoft.com/download/b7ca2c3f-d320-4795-be0f-529a0117abb4/SurfaceLaptop7_ARM_Win11_${version}.msi";
      hash = "sha256-KyHgMGk/oytVctE5AhdXer+x7mJk2uP8Vgc7v78wSRc=";
    };

    nativeBuildInputs = [ pkgs.msitools ];
    unpackPhase = ''
      msiextract -C . "$src"
      cd SurfaceUpdate
    '';

    installPhase = lib.concatLines (
      lib.mapAttrsToList (dst: file: ''install -Dm644 "${file}" "$out/lib/firmware/${dst}"'') files
    );
  };
in
{
  hardware = {
    enableRedistributableFirmware = lib.mkForce false;
    firmware = [
      pkgs.x1e80100-linux-firmware
      romulus-firmware
    ];
  };
}
