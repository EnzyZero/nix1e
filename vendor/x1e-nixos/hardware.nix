{
  hardware.deviceTree.overlays = [
    {
      name = "surface-laptop-7-sam";
      dtsFile = ./kernel/dtb-overlays/surface-laptop-7-sam.dts;
    }
    {
      name = "surface-laptop-7-thermal";
      dtsFile = ./kernel/dtb-overlays/surface-laptop-7-thermal.dts;
    }
  ];
}
