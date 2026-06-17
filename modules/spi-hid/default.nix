{
  path = "drivers/hid/spi-hid";
  config = {
    "SPI_HID_CORE" = "m";
    "SPI_HID_OF" = "m";
  };

  series = [
    {
      id = "20260609-send-upstream-v4-0-b843d5e6ced3@chromium.org";
      hash = "sha256-x9TMe6DdACpyanuJKfsich61ayBt92MQOfKXsDCSMXo=";
    }
  ];
  patches = [ ./fullduplex.patch ];
}
