{ pkgs, ... }:
{
  boot = {
    initrd.extraFirmwarePaths = [
      "ath12k/WCN7850/hw2.0/amss.bin"
      "ath12k/WCN7850/hw2.0/board-2.bin"
      "ath12k/QCN9274/hw2.0/board-2.bin"
      "ath12k/QCN9274/hw2.0/firmware-2.bin"
      "ath12k/WCN7850/hw2.0/m3.bin"
      "qcom/x1e80100/microsoft/Romulus/adsp_dtbs.elf"
      "qcom/x1e80100/microsoft/Romulus/adspr.jsn"
      "qcom/x1e80100/microsoft/Romulus/adsps.jsn"
      "qcom/x1e80100/microsoft/Romulus/adspua.jsn"
      "qcom/x1e80100/microsoft/Romulus/battmgr.jsn"
      "qcom/x1e80100/microsoft/Romulus/cdsp_dtbs.elf"
      "qcom/x1e80100/microsoft/Romulus/cdspr.jsn"
      "qcom/x1e80100/microsoft/Romulus/qcadsp8380.mbn"
      "qcom/x1e80100/microsoft/Romulus/qccdsp8380.mbn"
      "qcom/x1e80100/microsoft/qcdxkmsuc8380.mbn"
      "qcom/gen70500_sqe.fw"
      "qcom/gen70500_sqe.fw.zst"
      "qcom/gen70500_gmu.bin"
    ];

    loader.systemd-boot = {
      edk2-uefi-shell.enable = true;
      extraFiles = {
        "EFI/systemd/drivers/slbouncea64.efi" = "${pkgs.slbounce}/share/slbounce/slbounce.efi";
        "tcblaunch.exe" = "${pkgs.tcblaunch}/share/tcblaunch/tcblaunch.exe";
        "sltest.efi" = "${pkgs.slbounce}/share/slbounce/sltest.efi";
        "dtbhack.efi" = "${pkgs.slbounce}/share/slbounce/dtbhack.efi";
        "firmware/qcom/x1e80100/microsoft/Romulus/qcadsp8380.mbn" =
          "${pkgs.x1e80100-firmware}/lib/firmware/qcom/x1e80100/microsoft/Romulus/qcadsp8380.mbn";
        "firmware/qcom/x1e80100/microsoft/Romulus/adsp_dtbs.elf" =
          "${pkgs.x1e80100-firmware}/lib/firmware/qcom/x1e80100/microsoft/Romulus/adsp_dtbs.elf";
        "firmware/qcom/x1e80100/microsoft/Romulus/qccdsp8380.mbn" =
          "${pkgs.x1e80100-firmware}/lib/firmware/qcom/x1e80100/microsoft/Romulus/qccdsp8380.mbn";
        "firmware/qcom/x1e80100/microsoft/Romulus/cdsp_dtbs.elf" =
          "${pkgs.x1e80100-firmware}/lib/firmware/qcom/x1e80100/microsoft/Romulus/cdsp_dtbs.elf";
      };
    };
  };
}
