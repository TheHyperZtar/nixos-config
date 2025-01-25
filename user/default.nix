{...}: {
  imports = [
    ./wm/hyprland
    ./apps/browser/firefox.nix
    ./apps/cli/btop.nix
    ./apps/cli/cava.nix
    ./apps/cli/fastfetch
    ./apps/cli/git.nix
    ./apps/cli/starship.nix
    ./apps/cli/zoxide.nix
    ./apps/editor/nvim.nix
    ./apps/editor/vscode.nix
    ./apps/games
    ./apps/multimedia/mpv.nix
    ./apps/multimedia/obs.nix
    ./apps/multimedia/spotify.nix
    ./apps/social/nixcord.nix
    ./apps/virtualization/qemu.nix
    ./apps/shell/zsh.nix
    ./style/stylix
  ];
}
