pkgs: {
  boot = {
    kernelPackages = pkgs.linuxPackages_testing;
    kernelParams = [ "systemd.tpm2_wait=false" ];
    initrd.availableKernelModules = [ "phy_qcom_qmp_pcie" ];
  };
}
