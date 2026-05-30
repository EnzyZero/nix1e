pkgs: {
  boot = {
    kernelPackages = pkgs.linuxPackages_testing;
    kernelParams = [ "systemd.tpm2_wait=false" ];
  };
}
