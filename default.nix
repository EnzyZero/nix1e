{ pkgs, ... }:
{
  imports = [ ./modules ];

  boot = {
    kernelPackages = pkgs.linuxPackages_testing;
    initrd.availableKernelModules = [ "phy_qcom_qmp_pcie" ];
    kernelParams = [
      "clk_ignore_unused"
      "systemd.tpm2_wait=false"
    ];
  };
}
