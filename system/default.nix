{...}: {
  imports = [
    ./hardware/drives/THZ-SSD.nix
    ./wm/hyprland.nix
    ./lm/greetd.nix
    ./services/pipewire.nix
    ./services/openrgb.nix
    ./style/stylix
    ./apps/games
    ./apps/misc/nix-ld.nix
    ./apps/misc/appimage.nix
    ./apps/virtualization/waydroid.nix
    ./apps/multimedia/obs.nix
  ];
}
