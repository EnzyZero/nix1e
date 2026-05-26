{ pkgs }: {
  nixpkgs.overlays = [
    import ./overlay.nix
    pkgs.overlays.default
  ];
}
