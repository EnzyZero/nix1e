{
  pkgs,
  ...
}:
{
  hardware = {
    firmware = [
      pkgs.x1e80100-firmware
      pkgs.x1e80100-linux-firmware
    ];
    deviceTree.overlays = [
      {
        name = "surface-laptop-7-sam";
        dtsFile = ./kernel/dtb-overlays/surface-laptop-7-sam.dts;
      }
      {
        name = "surface-laptop-7-thermal";
        dtsFile = ./kernel/dtb-overlays/surface-laptop-7-thermal.dts;
      }
    ];
  };
}
