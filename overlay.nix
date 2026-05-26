final: prev: {
  iptsd = prev.iptsd.overrideAttrs (old: {
    patches = (old.patches or []) ++
      [ ./patches/iptsd-touchpad_click.patch ];
  });
}
