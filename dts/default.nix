{ config, lib, ... }:
let
  name =
    {
      "13" = "qcom/x1e80100-microsoft-romulus13.dtb";
      "15" = "qcom/x1e80100-microsoft-romulus15.dtb";
    }
    .${config.nix1e.model};
in
{
  options.nix1e.model = lib.mkOption {
    default = "13";
    type = lib.types.enum [
      "13"
      "15"
    ];
  };

  config.hardware.deviceTree = {
    enable = true;
    inherit name;
    overlays = [
      {
        name = "touchpad";
        dtsFile = ./touchpad.dts;
      }
    ];
  };
}
