{...}: {
  imports = [
    ./wm/hyprland
    ./apps/browser/firefox.nix
    ./apps/cli
    ./apps/editor/nvim.nix
    ./apps/editor/vscode.nix
    ./apps/games
    ./apps/multimedia
    ./apps/social/nixcord.nix
    ./apps/virtualization/qemu.nix
    ./apps/shell/zsh.nix
    ./style/stylix
  ];
}
