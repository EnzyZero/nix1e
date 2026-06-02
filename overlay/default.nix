final: prev: {
  iptsd = prev.iptsd.overrideAttrs (old: {
    patches = (old.patches or [ ]) ++ [ ./iptsd.patch ];
  });
}
