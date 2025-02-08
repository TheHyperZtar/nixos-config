{...}: {
  programs = {
    hyprland = {
      enable = true;
    };
  };

  services.logind.extraConfig = ''
    HandlePowerKey=ignore
  '';

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [
        "kitty.desktop"
      ];
    };
  };
}
