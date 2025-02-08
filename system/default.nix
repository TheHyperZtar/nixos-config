{...}: {
  imports = [
    ./hardware/drives/THZ-SSD.nix
    ./wm/hyprland.nix
    ./lm/lightdm.nix
    ./services/pipewire.nix
    ./services/openrgb.nix
    ./style/stylix
    ./apps/games
    ./apps/shell/zsh.nix
    ./apps/cli/adb.nix
    ./apps/cli/nh.nix
    ./apps/misc/nix-ld.nix
    ./apps/misc/appimage.nix
    ./apps/virtualization/waydroid.nix
    ./apps/multimedia/obs.nix
  ];
}
