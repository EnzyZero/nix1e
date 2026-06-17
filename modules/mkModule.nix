{
  pkgs,
  lib,
  kernel,
}:
let
  build = "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build";
  fetchMbx =
    id: hash:
    pkgs.runCommand "${id}.mbx"
      {
        src = pkgs.fetchurl {
          url = "https://lore.kernel.org/all/${id}/t.mbox.gz";
          inherit hash;
        };
        nativeBuildInputs = with pkgs; [
          git
          b4
        ];
      }
      ''
        export HOME="$TMPDIR"
        zcat "$src" | b4 --offline-mode am -m- -o- > "$out"
      '';
in
pname: version: file:
(
  {
    base ? kernel.src,
    path ? ".",
    config ? { },
    series ? [ ],
    patches ? [ ],
    files ? { },
  }:
  let
    flags = lib.mapAttrsToList (key: val: "CONFIG_${key}=${val}") config;
    make = "make -C ${build} ${lib.escapeShellArgs flags} M=$PWD/${path}";
  in
  pkgs.stdenv.mkDerivation {
    inherit pname version;
    src = pkgs.applyPatches {
      src = base;
      patches = map ({ id, hash }: fetchMbx id hash) series ++ patches;
      postPatch = lib.concatLines (lib.mapAttrsToList (dst: file: "install -Dm644 ${file} ${dst}") files);
    };

    nativeBuildInputs = kernel.moduleBuildDependencies;
    buildPhase = "${make} modules";
    installPhase = "${make} modules_install INSTALL_MOD_PATH=$out";
  }
)
  (if builtins.isPath file then import file else file)
