{...}: {
  imports = [
    ./wm/hyprland
    ./apps/browser/firefox
    ./apps/cli/btop.nix
    ./apps/cli/cava.nix
    ./apps/cli/fastfetch
    ./apps/cli/git.nix
    ./apps/editor/nvim.nix
    ./apps/editor/vscode.nix
    ./apps/games
    ./apps/multimedia/mpv.nix
    ./apps/multimedia/obs.nix
    ./apps/multimedia/spotify.nix
    ./apps/virtualization/qemu.nix
    ./apps/shell/zsh.nix
    ./style/stylix
  ];
}
