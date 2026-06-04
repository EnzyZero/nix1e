{
  mkModule,
  mkSrc,
  patch,
  ...
}:
let
  src' = mkSrc "20260402-send-upstream-v3-0-6091c458d357@chromium.org" "sha256-+eaCgSMmBU4vL4+uvqmyQ+nBrPORuFW6njL2xXWxPDs=";
  src =
    patch src'
      [
        ./chipselect.patch
        ./spi.patch
      ]
      {
        "drivers/hid/spi-hid/Makefile" = ./Makefile;
      };
in
mkModule "spi-hid" "3" "${src}/drivers/hid/spi-hid"
