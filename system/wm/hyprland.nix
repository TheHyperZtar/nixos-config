{...}: {
  programs.hyprland.enable = true;
  services.logind.powerKey = "ignore";
  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [
        "kitty.desktop"
      ];
    };
  };
}
