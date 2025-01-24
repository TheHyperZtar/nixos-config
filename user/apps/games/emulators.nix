{pkgs, ...}: {
  imports = [./cores];
  home.packages = with pkgs; [
    dolphin-emu
    easyrpg-player
    pcsx2
    (retroarch.withCores (
      cores:
        with cores; [
          fceumm
          gambatte
          genesis-plus-gx
          melonds
          mgba
          parallel-n64
          snes9x
        ]
    ))
    ryubing
  ];
}
