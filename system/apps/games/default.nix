{pkgs, ...}: {
  imports = [
    ./steam.nix
    ./tools.nix
  ];

  services.udev.packages = [pkgs.game-devices-udev-rules];
  programs = {
    gamemode.enable = true;
    ns-usbloader.enable = true;
  };
}
