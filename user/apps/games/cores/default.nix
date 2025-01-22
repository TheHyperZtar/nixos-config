{...}: {
  nixpkgs.overlays = [
    (final: prev: {
      libretro = prev.libretro.overrideScope (gfinal: gprev: {
        parallel-n64 = prev.callPackage ./parallel-n64 {mkLibretroCore = prev.callPackage ./mkLibretroCore.nix;};
      });
    })
  ];
}
