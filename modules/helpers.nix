{
  pkgs,
  lib,
  kernel,
}:
let
  build = "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build";
in
{
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

  mkSrc =
    msg: hash:
    let
      mbox = pkgs.fetchurl {
        url = "https://lore.kernel.org/all/${msg}/t.mbox.gz";
        postFetch = ''gunzip < "$downloadedFile" > "$out"'';
        downloadToTemp = true;
        inherit hash;
      };
    in
    pkgs.runCommand msg { } ''
      mkdir -p $out
      patch -d $out -p1 -f < ${mbox} || true
    '';

  patch =
    src: patches: files:
    pkgs.applyPatches {
      inherit src patches;
      postPatch = lib.concatLines (
        lib.mapAttrsToList (dst: file: "install -D -m644 ${file} ${dst}") files
      );
    };
}
